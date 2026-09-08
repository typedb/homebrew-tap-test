# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "7e3baa369a5afd3c42c3e21a4672785dbdbb09ec"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/7e3baa369a5afd3c42c3e21a4672785dbdbb09ec/typedb-all-mac-arm64-7e3baa369a5afd3c42c3e21a4672785dbdbb09ec.zip"
    sha256 "deae79eeee3f6c24f78ae46bb84a6a8787815013ce5f6ab8dcc33fc2f6cacabd"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/7e3baa369a5afd3c42c3e21a4672785dbdbb09ec/typedb-all-mac-x86_64-7e3baa369a5afd3c42c3e21a4672785dbdbb09ec.zip"
    sha256 "fef88c75a475daf6fc022f5d78fc4b8905dd3d866121df717363a8df2f6dad98"
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
