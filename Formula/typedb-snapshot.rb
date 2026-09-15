# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "207b5142056666a4bdd8d889ec45beb7b94a4e52"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/207b5142056666a4bdd8d889ec45beb7b94a4e52/typedb-all-mac-arm64-207b5142056666a4bdd8d889ec45beb7b94a4e52.zip"
    sha256 "a0d40fe0b396797b9e39e3409023e0825839d7383e47f83462f9fed6fa6ce7da"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/207b5142056666a4bdd8d889ec45beb7b94a4e52/typedb-all-mac-x86_64-207b5142056666a4bdd8d889ec45beb7b94a4e52.zip"
    sha256 "47b01bc37ff3bb17c56e6b30a77466cfce886875354614d222e92813d188d761"
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
