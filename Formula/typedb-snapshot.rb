# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "5abf5fed4687f2c9199ce09134d930d683e70f0b"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5abf5fed4687f2c9199ce09134d930d683e70f0b/typedb-all-mac-arm64-5abf5fed4687f2c9199ce09134d930d683e70f0b.zip"
    sha256 "35e82714907041f24b1396798cc2d7c60297fe8b42ef9eedfe6611ea30ee833e"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5abf5fed4687f2c9199ce09134d930d683e70f0b/typedb-all-mac-x86_64-5abf5fed4687f2c9199ce09134d930d683e70f0b.zip"
    sha256 "f3bacf6d0861520cf50da66deb13b246f9f54c2d3cdbbe270efe834a1e648517"
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
