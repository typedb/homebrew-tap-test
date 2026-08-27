# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "4cf6a29d548c56918331fa2b8f341f94b5957648"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/4cf6a29d548c56918331fa2b8f341f94b5957648/typedb-all-mac-arm64-4cf6a29d548c56918331fa2b8f341f94b5957648.zip"
    sha256 "cb8fa41df80fdba7d2b7a7e442c44c08c5d1286fae4513d97f15eb1311f15902"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/4cf6a29d548c56918331fa2b8f341f94b5957648/typedb-all-mac-x86_64-4cf6a29d548c56918331fa2b8f341f94b5957648.zip"
    sha256 "75dea4f068eae9a5c00c1018fcab8c343fc69aa174783aba3f0e06746dad6c95"
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
