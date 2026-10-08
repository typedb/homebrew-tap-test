# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "2bf93b9f40d7757b637d21d2efc6866b820ef137"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/2bf93b9f40d7757b637d21d2efc6866b820ef137/typedb-all-mac-arm64-2bf93b9f40d7757b637d21d2efc6866b820ef137.zip"
    sha256 "f708bb9297aed1fab174fdae765d15fa8448493ed56df17827285ee8694afc8d"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/2bf93b9f40d7757b637d21d2efc6866b820ef137/typedb-all-mac-x86_64-2bf93b9f40d7757b637d21d2efc6866b820ef137.zip"
    sha256 "e9e9deeea466f173273c346f8a398f485739b32701a72b231fb3f0dc8fb10a07"
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
