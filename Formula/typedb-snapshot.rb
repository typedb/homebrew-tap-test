# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "dbbae1c910b01154607af26bc6378488876bd147"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/dbbae1c910b01154607af26bc6378488876bd147/typedb-all-mac-arm64-dbbae1c910b01154607af26bc6378488876bd147.zip"
    sha256 "79fac2d84340f94d2c4c1813f920e2109a2a7684ae7ee6d59ff25966d33bad9a"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/dbbae1c910b01154607af26bc6378488876bd147/typedb-all-mac-x86_64-dbbae1c910b01154607af26bc6378488876bd147.zip"
    sha256 "8f6f730223e39f56d50cc983db3c89bf96f4c3a1983087fff8c827abd27d9e9c"
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
