# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "c070d2fd53c2faf6d4063128123f3fb18a3928c9"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/c070d2fd53c2faf6d4063128123f3fb18a3928c9/typedb-all-mac-arm64-c070d2fd53c2faf6d4063128123f3fb18a3928c9.zip"
    sha256 "f257703ac5e6fc840691be11e9f67c56d16d1fa0aa00a993ef0bc13610df742b"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/c070d2fd53c2faf6d4063128123f3fb18a3928c9/typedb-all-mac-x86_64-c070d2fd53c2faf6d4063128123f3fb18a3928c9.zip"
    sha256 "9607c7d353e418cd4ed1178897d812de61cbabf173230e57f40bc4cff6101f3f"
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
