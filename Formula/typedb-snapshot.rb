# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "4d27c487676a1e598b1cf9dca9d606784dfac5b4"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/4d27c487676a1e598b1cf9dca9d606784dfac5b4/typedb-all-mac-arm64-4d27c487676a1e598b1cf9dca9d606784dfac5b4.zip"
    sha256 "d1e3ac73fdcf684fbc87ae176e050b17537dd91c79be227a8f931a2d787920f8"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/4d27c487676a1e598b1cf9dca9d606784dfac5b4/typedb-all-mac-x86_64-4d27c487676a1e598b1cf9dca9d606784dfac5b4.zip"
    sha256 "e5124b5dccdaa951430d6a2b0b705b87af3c17f8a6fd461b2a0633b1ff3671af"
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
