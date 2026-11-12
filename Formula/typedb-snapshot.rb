# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "9395edd0c22510d098d508d1550744a5be265c01"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/9395edd0c22510d098d508d1550744a5be265c01/typedb-all-mac-arm64-9395edd0c22510d098d508d1550744a5be265c01.zip"
    sha256 "2d2294287ec602f21cd24a9f1b6cbadb8d923e92d90ca2a057bf71aa9d3479cf"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/9395edd0c22510d098d508d1550744a5be265c01/typedb-all-mac-x86_64-9395edd0c22510d098d508d1550744a5be265c01.zip"
    sha256 "85a6218d3d42167716e6f9b7702a6a85ea7d930da1c966881e7a2db5217a2663"
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
