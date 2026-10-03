# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "87653a75ff2014b657ef43e5426653ca0e08f8fc"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/87653a75ff2014b657ef43e5426653ca0e08f8fc/typedb-all-mac-arm64-87653a75ff2014b657ef43e5426653ca0e08f8fc.zip"
    sha256 "816867ae3d09db80788d6ca51697d840f701d38c879e3c731b0c1229c8704957"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/87653a75ff2014b657ef43e5426653ca0e08f8fc/typedb-all-mac-x86_64-87653a75ff2014b657ef43e5426653ca0e08f8fc.zip"
    sha256 "d1792efc849e3717f95ce0d02877c8f7b14a82ca1db964cd98ef146280c26666"
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
