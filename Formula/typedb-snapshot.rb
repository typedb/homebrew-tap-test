# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "2256711abd532742dae8e822a9ad5cce63e69b1a"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/2256711abd532742dae8e822a9ad5cce63e69b1a/typedb-all-mac-arm64-2256711abd532742dae8e822a9ad5cce63e69b1a.zip"
    sha256 "e63afad118927eee1332e586b62df969b0529c753a288bdd6bc6c8acce323088"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/2256711abd532742dae8e822a9ad5cce63e69b1a/typedb-all-mac-x86_64-2256711abd532742dae8e822a9ad5cce63e69b1a.zip"
    sha256 "9ffd6c0efb0a4b54b90135bf64972219e8227076755d1f64c3f852164a181ab3"
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
