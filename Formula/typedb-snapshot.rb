# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "6226626f190b3c6a71bed4c31fd63829577c1ec7"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/6226626f190b3c6a71bed4c31fd63829577c1ec7/typedb-all-mac-arm64-6226626f190b3c6a71bed4c31fd63829577c1ec7.zip"
    sha256 "5befc4597f43ff60de8080837023ce93a3a7ff12ffd6e8260b1424ccc05a44ff"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/6226626f190b3c6a71bed4c31fd63829577c1ec7/typedb-all-mac-x86_64-6226626f190b3c6a71bed4c31fd63829577c1ec7.zip"
    sha256 "86177034d70420584f9b4619175cad6207b8be04865f873e5edb37ae79912979"
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
