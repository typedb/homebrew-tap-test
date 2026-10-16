# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "c143215e8e8043fe0a614a358e2aafd68ed5dea6"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/c143215e8e8043fe0a614a358e2aafd68ed5dea6/typedb-all-mac-arm64-c143215e8e8043fe0a614a358e2aafd68ed5dea6.zip"
    sha256 "2adecd60016c3655596bc62d3225f6cdceb2522af0a5cc2f3a01720e4a5ef274"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/c143215e8e8043fe0a614a358e2aafd68ed5dea6/typedb-all-mac-x86_64-c143215e8e8043fe0a614a358e2aafd68ed5dea6.zip"
    sha256 "a4ba6556939212a225231c13ed648c8048816890dff2a543d603408670b78175"
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
