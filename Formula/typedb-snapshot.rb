# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "3ada200332e811639547d147d08f95d4e1975f94"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/3ada200332e811639547d147d08f95d4e1975f94/typedb-all-mac-arm64-3ada200332e811639547d147d08f95d4e1975f94.zip"
    sha256 "7c3df0b2b65150a5fe4098f67e293b733c10c00c5e95a70d6f48d027fd655634"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/3ada200332e811639547d147d08f95d4e1975f94/typedb-all-mac-x86_64-3ada200332e811639547d147d08f95d4e1975f94.zip"
    sha256 "22ecf69cef98ebb8d55c473c7e0af09a092377a27b2cfc9d545e4509c17f9811"
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
