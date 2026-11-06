# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "c58ada3472ee67dddd2b5f5216f724d3ce05c1d3"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/c58ada3472ee67dddd2b5f5216f724d3ce05c1d3/typedb-all-mac-arm64-c58ada3472ee67dddd2b5f5216f724d3ce05c1d3.zip"
    sha256 "5a5c053386c9e66265b51763ad2577106ec19a9dc96f1c75db9590d7b06ee991"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/c58ada3472ee67dddd2b5f5216f724d3ce05c1d3/typedb-all-mac-x86_64-c58ada3472ee67dddd2b5f5216f724d3ce05c1d3.zip"
    sha256 "5ba96ebcf428f13a7572c75f129de017d9d5bb5b8cac233c541ec143fc3d2635"
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
