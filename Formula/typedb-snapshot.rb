# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "6a80364e4d44ccf0b29eb45dee416878d6a54917"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/6a80364e4d44ccf0b29eb45dee416878d6a54917/typedb-all-mac-arm64-6a80364e4d44ccf0b29eb45dee416878d6a54917.zip"
    sha256 "077a12ddafc4fb380868e6bf04f5ec7a4a74e8542f6e9fb47e3de944469ec4c6"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/6a80364e4d44ccf0b29eb45dee416878d6a54917/typedb-all-mac-x86_64-6a80364e4d44ccf0b29eb45dee416878d6a54917.zip"
    sha256 "0f3a96a08ac2c3427ee9f11826c7ced284407c95f972f2be20952fca7f37aaaa"
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
