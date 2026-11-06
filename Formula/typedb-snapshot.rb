# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "145de9c4bcb83cb390a00d35606f5a594cf27ced"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/145de9c4bcb83cb390a00d35606f5a594cf27ced/typedb-all-mac-arm64-145de9c4bcb83cb390a00d35606f5a594cf27ced.zip"
    sha256 "61ff7918c39c1d8218cb399fe573073fd02ce0b740bfd996829d1bfd50ab89c0"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/145de9c4bcb83cb390a00d35606f5a594cf27ced/typedb-all-mac-x86_64-145de9c4bcb83cb390a00d35606f5a594cf27ced.zip"
    sha256 "4df9840e12d3b69345c1759838a168a1a4dbb53b2e6e9357550707cd3d1a48e1"
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
