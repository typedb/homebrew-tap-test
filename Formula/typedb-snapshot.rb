# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "e0f0313532381b963804109b050ec248912717c5"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/e0f0313532381b963804109b050ec248912717c5/typedb-all-mac-arm64-e0f0313532381b963804109b050ec248912717c5.zip"
    sha256 "38935f5dd68d9b86da1f70632f58c88d3a8e6e32d0b158ea7e0a997df09cca01"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/e0f0313532381b963804109b050ec248912717c5/typedb-all-mac-x86_64-e0f0313532381b963804109b050ec248912717c5.zip"
    sha256 "29824d367abad94687b9f59495a6a17ceab3ffae3382936bb9d95238d7fe0463"
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
