# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "cc9b44cf6037f37b6ce5dc6b0e3c287f85df89b9"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/cc9b44cf6037f37b6ce5dc6b0e3c287f85df89b9/typedb-all-mac-arm64-cc9b44cf6037f37b6ce5dc6b0e3c287f85df89b9.zip"
    sha256 "e8d93ddac0cd947e527ce72af1695d04a1fc4ffb3861220f4db69fbbe73e14e6"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/cc9b44cf6037f37b6ce5dc6b0e3c287f85df89b9/typedb-all-mac-x86_64-cc9b44cf6037f37b6ce5dc6b0e3c287f85df89b9.zip"
    sha256 "a0ca9a628cd017f986a34dd578e57a3034cdbb00c76fc14bcae38754727123d2"
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
