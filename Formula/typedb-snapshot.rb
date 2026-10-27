# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "2879ce4f2d8880b8c18d951619b9ff4ea2462368"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/2879ce4f2d8880b8c18d951619b9ff4ea2462368/typedb-all-mac-arm64-2879ce4f2d8880b8c18d951619b9ff4ea2462368.zip"
    sha256 "d730fb4835e482547df23d45f3eb1f2d7ea50f2ed0480c199c3ce3ee18ada93c"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/2879ce4f2d8880b8c18d951619b9ff4ea2462368/typedb-all-mac-x86_64-2879ce4f2d8880b8c18d951619b9ff4ea2462368.zip"
    sha256 "8cae42f7f3bdf047489319362323d85c9fef65db3490fe06092e2e19f7e7e926"
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
