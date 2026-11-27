# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "217e9625f501f2de5b874485200a62d3ab07dd74"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/217e9625f501f2de5b874485200a62d3ab07dd74/typedb-all-mac-arm64-217e9625f501f2de5b874485200a62d3ab07dd74.zip"
    sha256 "2010f0d8ccb7c64b05e9439ac9a1c24ba223c007825b1091ee2fe8223bef3c7f"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/217e9625f501f2de5b874485200a62d3ab07dd74/typedb-all-mac-x86_64-217e9625f501f2de5b874485200a62d3ab07dd74.zip"
    sha256 "d90cacce4d853c7e3c07932a1163c48cf54116cbfa8423700b97830fc58bf8c5"
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
