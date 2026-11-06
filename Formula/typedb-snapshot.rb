# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "0712a5cad0cac0b681f408190c74e6a09c8132e1"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/0712a5cad0cac0b681f408190c74e6a09c8132e1/typedb-all-mac-arm64-0712a5cad0cac0b681f408190c74e6a09c8132e1.zip"
    sha256 "2103f987abf00e6904a2df5469017060849de523cf7ec8abf33f7d66696b04a5"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/0712a5cad0cac0b681f408190c74e6a09c8132e1/typedb-all-mac-x86_64-0712a5cad0cac0b681f408190c74e6a09c8132e1.zip"
    sha256 "bc57ccb37130479b89538c5443eb70158005c0e7e0a1a7093c68d2f83d1e4c20"
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
