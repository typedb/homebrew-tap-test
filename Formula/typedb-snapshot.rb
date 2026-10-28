# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "ddc372fcb3b6f3a4444f290fc0e8f5d6365504fb"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ddc372fcb3b6f3a4444f290fc0e8f5d6365504fb/typedb-all-mac-arm64-ddc372fcb3b6f3a4444f290fc0e8f5d6365504fb.zip"
    sha256 "a86ba835b12d52e559a9aa18bd91ce244865a42110892baef387a93b79e0f891"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ddc372fcb3b6f3a4444f290fc0e8f5d6365504fb/typedb-all-mac-x86_64-ddc372fcb3b6f3a4444f290fc0e8f5d6365504fb.zip"
    sha256 "d48dc6d06c222bd15fa8ad495661f104a4d1cef69f3c688fadfbaa63f2c82088"
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
