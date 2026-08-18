# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "e3bff5464d374f433b4adb86152d81170c946b45"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/e3bff5464d374f433b4adb86152d81170c946b45/typedb-all-mac-arm64-e3bff5464d374f433b4adb86152d81170c946b45.zip"
    sha256 "d388cc7b2fe9b9bfd35abc3effec58466ea015357101c9a52be0f1dc7d94f591"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/e3bff5464d374f433b4adb86152d81170c946b45/typedb-all-mac-x86_64-e3bff5464d374f433b4adb86152d81170c946b45.zip"
    sha256 "a8086af639700dc9ee5417ad8695c0801061f16a09a59f452f5b50352f25f55b"
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
