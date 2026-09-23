# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "7a0f9393de86e8994f31fa524296a7b39d51ed2f"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/7a0f9393de86e8994f31fa524296a7b39d51ed2f/typedb-all-mac-arm64-7a0f9393de86e8994f31fa524296a7b39d51ed2f.zip"
    sha256 "9f24db2f1ceaef7b6a3d92cd5b4ff268a68da52ab68628683563bf2e24fd5d6c"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/7a0f9393de86e8994f31fa524296a7b39d51ed2f/typedb-all-mac-x86_64-7a0f9393de86e8994f31fa524296a7b39d51ed2f.zip"
    sha256 "096570eac9adddc37cc488655b5961251effced7a25aca6832f80a8aa5b150ee"
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
