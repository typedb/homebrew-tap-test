# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "3d929b655e359458b0e88f647c7d2614db9e1cd3"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/3d929b655e359458b0e88f647c7d2614db9e1cd3/typedb-all-mac-arm64-3d929b655e359458b0e88f647c7d2614db9e1cd3.zip"
    sha256 "76847c724c9b6d7553f6e1496fead5c55385ca69eb327aebf2fdb77d088b2da0"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/3d929b655e359458b0e88f647c7d2614db9e1cd3/typedb-all-mac-x86_64-3d929b655e359458b0e88f647c7d2614db9e1cd3.zip"
    sha256 "cd8a1524593b4c9ae81424490cd0b5300caf404605f1313fb76896d2d1b4503d"
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
