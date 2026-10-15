# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "9d4921b2c7686aa2bc746c8b74357e7a2eb9b204"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/9d4921b2c7686aa2bc746c8b74357e7a2eb9b204/typedb-all-mac-arm64-9d4921b2c7686aa2bc746c8b74357e7a2eb9b204.zip"
    sha256 "ee04614f6c7e7d513e2ae0ed03b3cfa852e3047fc593ddfbd5f69fce27417092"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/9d4921b2c7686aa2bc746c8b74357e7a2eb9b204/typedb-all-mac-x86_64-9d4921b2c7686aa2bc746c8b74357e7a2eb9b204.zip"
    sha256 "38f8169df8c159c25e337c20814354c4789bba41c820b31dcc5e25434ebc47dd"
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
