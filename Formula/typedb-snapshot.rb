# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "87be0f71a846aae21320dbfc3487ad9a01bf1066"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/87be0f71a846aae21320dbfc3487ad9a01bf1066/typedb-all-mac-arm64-87be0f71a846aae21320dbfc3487ad9a01bf1066.zip"
    sha256 "0dc9607b02b4cc175018ce7ad4f42890a483d72e6c3f9447de39f4c254291398"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/87be0f71a846aae21320dbfc3487ad9a01bf1066/typedb-all-mac-x86_64-87be0f71a846aae21320dbfc3487ad9a01bf1066.zip"
    sha256 "30c79460dc2369223533c7d09fb00a864cea61be176ed536951e3e8636697c8f"
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
