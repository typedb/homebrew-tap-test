# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "df38617ccbaa8098d1a4bc9d3a707a2a196a9894"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/df38617ccbaa8098d1a4bc9d3a707a2a196a9894/typedb-all-mac-arm64-df38617ccbaa8098d1a4bc9d3a707a2a196a9894.zip"
    sha256 "01a373a7bb2e369a78bad0d062a92b01b27b0a9e840d1430e5f2d1ccd26e26b3"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/df38617ccbaa8098d1a4bc9d3a707a2a196a9894/typedb-all-mac-x86_64-df38617ccbaa8098d1a4bc9d3a707a2a196a9894.zip"
    sha256 "e97284af012d14065c983f0796b8d6a108d30bef0838af51f2633022d3e62f25"
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
