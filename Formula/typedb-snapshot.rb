# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a3a98020e79af8da03b971134792188102f9ee94"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a3a98020e79af8da03b971134792188102f9ee94/typedb-all-mac-arm64-a3a98020e79af8da03b971134792188102f9ee94.zip"
    sha256 "d48bf928f861d65fac66e7f720efc83ae6a1f55d69d746270bf019e6ad7c7f9f"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a3a98020e79af8da03b971134792188102f9ee94/typedb-all-mac-x86_64-a3a98020e79af8da03b971134792188102f9ee94.zip"
    sha256 "7bf040b7fff2cd6ebe443f0a5ea14284c549cfb33e36c679d53e4bcfbdee75f7"
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
