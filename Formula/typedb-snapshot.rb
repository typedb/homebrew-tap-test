# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/d61a79c4f729c8e1f1d7c288f97667e10df850b9/typedb-all-mac-arm64-d61a79c4f729c8e1f1d7c288f97667e10df850b9.zip"
    sha256 "8bc39d806e8d495d2e3642256d7d1d4290991bc2dbb94c491e0b8d9b094de15a"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/d61a79c4f729c8e1f1d7c288f97667e10df850b9/typedb-all-mac-x86_64-d61a79c4f729c8e1f1d7c288f97667e10df850b9.zip"
    sha256 "cbaa4dbd0b1e8ba3af8e8a9ab3945741b972a04d080e61b7c13b715b0e3dbfc4"
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
