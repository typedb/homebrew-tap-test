# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "ae8b88ad9f20bacc09cf81ec991d7a81c72aaa2d"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ae8b88ad9f20bacc09cf81ec991d7a81c72aaa2d/typedb-all-mac-arm64-ae8b88ad9f20bacc09cf81ec991d7a81c72aaa2d.zip"
    sha256 "c4144b05333958fa83015b7b9eefeca07454dccf83446992c2531074e255b1a6"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ae8b88ad9f20bacc09cf81ec991d7a81c72aaa2d/typedb-all-mac-x86_64-ae8b88ad9f20bacc09cf81ec991d7a81c72aaa2d.zip"
    sha256 "a0d18391579de4cb7ba755b4855f2f88e62da37039539aef589d7636c6172650"
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
