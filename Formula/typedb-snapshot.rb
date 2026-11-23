# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a07a452dd93617c494909fee36a659000a1bdf3f"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a07a452dd93617c494909fee36a659000a1bdf3f/typedb-all-mac-arm64-a07a452dd93617c494909fee36a659000a1bdf3f.zip"
    sha256 "fbaf5103906b871103cd01a2694d896ae4757526dec33ba379ca456aef692cd8"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a07a452dd93617c494909fee36a659000a1bdf3f/typedb-all-mac-x86_64-a07a452dd93617c494909fee36a659000a1bdf3f.zip"
    sha256 "512934c3edaefa52d3c261b24533aaa1f430933bfd635f57a04730e98101acd8"
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
