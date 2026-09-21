# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "0ff137d4036c357feaf8fbb69d589a720ae7642a"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/0ff137d4036c357feaf8fbb69d589a720ae7642a/typedb-all-mac-arm64-0ff137d4036c357feaf8fbb69d589a720ae7642a.zip"
    sha256 "fa865fa34b67123eb1bb5cb4590ad1b09c8e33d2d77fd9e01e021752ef683efb"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/0ff137d4036c357feaf8fbb69d589a720ae7642a/typedb-all-mac-x86_64-0ff137d4036c357feaf8fbb69d589a720ae7642a.zip"
    sha256 "0fed551be8df42b266d4edb49476c4bbe1dc6aa2958f60df3fa830c144ccb8dd"
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
