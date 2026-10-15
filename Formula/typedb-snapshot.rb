# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "d8d5b643f05f95b1129c9deae9013aebc62f4eee"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/d8d5b643f05f95b1129c9deae9013aebc62f4eee/typedb-all-mac-arm64-d8d5b643f05f95b1129c9deae9013aebc62f4eee.zip"
    sha256 "e3311d24578e3d518a7c68e1420bf52eefdddeb5ffd6b9660f1d44a35f264371"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/d8d5b643f05f95b1129c9deae9013aebc62f4eee/typedb-all-mac-x86_64-d8d5b643f05f95b1129c9deae9013aebc62f4eee.zip"
    sha256 "5381086415d629744a199ed40a566a3e762dbcc938e45f2a36f6634436c092aa"
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
