# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "f0a578fc83daa6a045b46fcdabb22a13c9de0ba7"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/f0a578fc83daa6a045b46fcdabb22a13c9de0ba7/typedb-all-mac-arm64-f0a578fc83daa6a045b46fcdabb22a13c9de0ba7.zip"
    sha256 "5f40567d2ac5634e1d7008d5edda620d090d37a5fa5df44c803ca449e1cc954a"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/f0a578fc83daa6a045b46fcdabb22a13c9de0ba7/typedb-all-mac-x86_64-f0a578fc83daa6a045b46fcdabb22a13c9de0ba7.zip"
    sha256 "d10e44955fcc51f6d0a6b10e1146dcbec3e2c8222cda610b8d8a8f995a740fc2"
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
