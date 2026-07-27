# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a3270a6e4a7a0a9bda50792d100c643f3bbe222c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a3270a6e4a7a0a9bda50792d100c643f3bbe222c/typedb-all-mac-arm64-a3270a6e4a7a0a9bda50792d100c643f3bbe222c.zip"
    sha256 "c2ee9e9af0521efe648ad9dbe56c22009e27ffe63d0162f45d0b5b109b398082"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a3270a6e4a7a0a9bda50792d100c643f3bbe222c/typedb-all-mac-x86_64-a3270a6e4a7a0a9bda50792d100c643f3bbe222c.zip"
    sha256 "78bd4ea2352dd2794a856d04ba86d04039f40f78e10338082f207218f99ab962"
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
