# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "4c01f61f4d84caeda8ebbe0ed9b3f3b1fe60d179"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/4c01f61f4d84caeda8ebbe0ed9b3f3b1fe60d179/typedb-all-mac-arm64-4c01f61f4d84caeda8ebbe0ed9b3f3b1fe60d179.zip"
    sha256 "f9e909ba180bec679836b54547f1e6658b977d738c6e1e44353a89a487fe9133"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/4c01f61f4d84caeda8ebbe0ed9b3f3b1fe60d179/typedb-all-mac-x86_64-4c01f61f4d84caeda8ebbe0ed9b3f3b1fe60d179.zip"
    sha256 "6e94b51c6d0193d29d5d949cdf65c8b055c416836c99d9961e4a672b7b11f3e4"
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
