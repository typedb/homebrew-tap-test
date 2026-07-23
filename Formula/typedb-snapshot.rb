# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ec00b9e38837f0b7202bbf0a75858277c889b904/typedb-all-mac-arm64-ec00b9e38837f0b7202bbf0a75858277c889b904.zip"
    sha256 "343db87846b176e5d9785c4dfac026f277f9a5f6f9e9440b244832ac2d9ff1c2"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ec00b9e38837f0b7202bbf0a75858277c889b904/typedb-all-mac-x86_64-ec00b9e38837f0b7202bbf0a75858277c889b904.zip"
    sha256 "3fb1088ea1bbcfb0e3fa355206aa05b1fd76576f5e9c7c58f04ea74f79671dbc"
  end

  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec / "typedb"
    mkdir_p var/"typedb/data"
    inreplace libexec/"server/config.yml", "server/data", var/"typedb/data"
    mkdir_p var/"typedb/logs"
    inreplace libexec/"server/config.yml", "server/logs", var/"typedb/logs"
  end

end
