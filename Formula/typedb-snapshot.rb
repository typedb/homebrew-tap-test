# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "da0b949cb93a0eb47e7ef7c171edb394375f54f1"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/da0b949cb93a0eb47e7ef7c171edb394375f54f1/typedb-all-mac-arm64-da0b949cb93a0eb47e7ef7c171edb394375f54f1.zip"
    sha256 "10def1207e425fbfb9402f1200dd7e927441c04430a4a4be30526ad61a648f58"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/da0b949cb93a0eb47e7ef7c171edb394375f54f1/typedb-all-mac-x86_64-da0b949cb93a0eb47e7ef7c171edb394375f54f1.zip"
    sha256 "f00d2153fba636a139d912e624094b8a9f5b07076780513842e561685885d778"
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
