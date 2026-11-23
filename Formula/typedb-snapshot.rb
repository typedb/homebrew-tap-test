# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "5ec7db6d86194c9ea23e79165a3681a8749ee68c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5ec7db6d86194c9ea23e79165a3681a8749ee68c/typedb-all-mac-arm64-5ec7db6d86194c9ea23e79165a3681a8749ee68c.zip"
    sha256 "e58d7e8953415899f626fe8a98d4e27dc96f9b7079410eb030990759541849ee"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5ec7db6d86194c9ea23e79165a3681a8749ee68c/typedb-all-mac-x86_64-5ec7db6d86194c9ea23e79165a3681a8749ee68c.zip"
    sha256 "3e217e3d0d32f3482fecb3811b7dfb7ad2edf1c9daa2497dd0579e8caf762ec7"
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
