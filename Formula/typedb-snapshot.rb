# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "9bd1bd0b62c0ff74afe5e63357718afd0608a9db"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/9bd1bd0b62c0ff74afe5e63357718afd0608a9db/typedb-all-mac-arm64-9bd1bd0b62c0ff74afe5e63357718afd0608a9db.zip"
    sha256 "15045942b6079e59cfa724196ca74d99266413423946cd596996fbd36064b3d6"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/9bd1bd0b62c0ff74afe5e63357718afd0608a9db/typedb-all-mac-x86_64-9bd1bd0b62c0ff74afe5e63357718afd0608a9db.zip"
    sha256 "36479116f6a535ebbbd5d2f61731c1250609f0cd23faf950a1624dfd6b2a1cbd"
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
