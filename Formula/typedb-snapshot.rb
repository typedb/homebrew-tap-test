# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "82908a03fb29e9af40d7d3c0cb40145d7656d6a4"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/82908a03fb29e9af40d7d3c0cb40145d7656d6a4/typedb-all-mac-arm64-82908a03fb29e9af40d7d3c0cb40145d7656d6a4.zip"
    sha256 "646403c9cb4a2229aea15d89daf6b33290335fde18ef41a5b9c8fe0f515befa3"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/82908a03fb29e9af40d7d3c0cb40145d7656d6a4/typedb-all-mac-x86_64-82908a03fb29e9af40d7d3c0cb40145d7656d6a4.zip"
    sha256 "c19fdac0632f249757104f827617d091af1a4efaa887762df3643edc944a60b6"
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
