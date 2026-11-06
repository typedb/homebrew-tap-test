# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "6e7d6c29727ae4917e508ecb413fcee408f8caa2"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/6e7d6c29727ae4917e508ecb413fcee408f8caa2/typedb-all-mac-arm64-6e7d6c29727ae4917e508ecb413fcee408f8caa2.zip"
    sha256 "d98d8c357ddd240bf4b5c77d016549197488a4f1ee5263eb6b60b7f673802469"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/6e7d6c29727ae4917e508ecb413fcee408f8caa2/typedb-all-mac-x86_64-6e7d6c29727ae4917e508ecb413fcee408f8caa2.zip"
    sha256 "5b9f4d6920f6d70cfbb8b5b0a757ca6275af3f0cb12a2200fdc7795fcd232b83"
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
