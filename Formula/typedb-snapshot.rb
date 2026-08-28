# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "db0103690eb318650947e4942bca7b4cbd4119f8"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/db0103690eb318650947e4942bca7b4cbd4119f8/typedb-all-mac-arm64-db0103690eb318650947e4942bca7b4cbd4119f8.zip"
    sha256 "e1b8d60af092c7b3417a4237340801f3cd1590d32f5fec30c0ed0005d8e75025"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/db0103690eb318650947e4942bca7b4cbd4119f8/typedb-all-mac-x86_64-db0103690eb318650947e4942bca7b4cbd4119f8.zip"
    sha256 "8ab982cea4595e1d435dc6dbae89f4d778e66059ba21a89bcac3f52338c10470"
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
