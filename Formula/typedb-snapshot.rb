# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5f18437c6becaa3d65925d033a95af5680d23f8b/typedb-all-mac-arm64-5f18437c6becaa3d65925d033a95af5680d23f8b.zip"
    sha256 "f1151d9018f4ae2387e09118fc0bfd0c9c5d096332740f3070029f6792a2f369"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5f18437c6becaa3d65925d033a95af5680d23f8b/typedb-all-mac-x86_64-5f18437c6becaa3d65925d033a95af5680d23f8b.zip"
    sha256 "deeb6a0a69e22e756569205f146eaf181e57ede1b69b55be8f43c0154db2dfbc"
  end

  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec / "typedb"
    mkdir_p var/"typedb/data"
    inreplace libexec/"server/conf/config.yml", "server/data", var/"typedb/data"
    mkdir_p var/"typedb/logs"
    inreplace libexec/"server/conf/config.yml", "server/logs", var/"typedb/logs"
  end

end
