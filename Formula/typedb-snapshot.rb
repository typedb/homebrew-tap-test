# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "ce4cfb6a11c5088b8f1f69c7020b0d0a03860d64"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ce4cfb6a11c5088b8f1f69c7020b0d0a03860d64/typedb-all-mac-arm64-ce4cfb6a11c5088b8f1f69c7020b0d0a03860d64.zip"
    sha256 "cc26a11fdcdde62c808c6d987b9cdeefe2bb96fe90705e346f69b6c7940692db"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ce4cfb6a11c5088b8f1f69c7020b0d0a03860d64/typedb-all-mac-x86_64-ce4cfb6a11c5088b8f1f69c7020b0d0a03860d64.zip"
    sha256 "5a5462c1f88989d68f046d24972ed8a3f9f5f0ec4899d4c20d1b4b2baa641af7"
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
