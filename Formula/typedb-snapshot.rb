# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "78d7124679b782b92359f6a16423bf34e2541d11"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/78d7124679b782b92359f6a16423bf34e2541d11/typedb-all-mac-arm64-78d7124679b782b92359f6a16423bf34e2541d11.zip"
    sha256 "aaed5d67644066d2fcbadda76d5fb0ff4b5b014ff0dcf34b21c26762f3de5788"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/78d7124679b782b92359f6a16423bf34e2541d11/typedb-all-mac-x86_64-78d7124679b782b92359f6a16423bf34e2541d11.zip"
    sha256 "fe4383ab4ea4e2c9e54eb5d748e4082427c37e50ef296a9043103a9e3fe726c9"
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
