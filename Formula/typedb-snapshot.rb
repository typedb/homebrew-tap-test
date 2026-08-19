# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "8183246b5c8eb66087aa82201e6bbb63ab5318a7"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/8183246b5c8eb66087aa82201e6bbb63ab5318a7/typedb-all-mac-arm64-8183246b5c8eb66087aa82201e6bbb63ab5318a7.zip"
    sha256 "975985f9bbf8e3e180cb1778eacb1d6f0d9f40c8fa9cdcdc5e3c37cb242f24fc"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/8183246b5c8eb66087aa82201e6bbb63ab5318a7/typedb-all-mac-x86_64-8183246b5c8eb66087aa82201e6bbb63ab5318a7.zip"
    sha256 "5e6424cc4c952bbca3c33bfe1ac7b23484aa9e7908822eed61357f7a306b3c49"
  end

  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec / "typedb"
    mkdir_p var/"typedb/data"
    inreplace libexec/"server/config.yml", "data-directory: \"data\"", "data-directory: \"#{var}/typedb/data\""
    mkdir_p var/"typedb/logs"
    inreplace libexec/"server/config.yml", "directory: \"logs\"", "directory: \"#{var}/typedb/logs\""
  end

end
