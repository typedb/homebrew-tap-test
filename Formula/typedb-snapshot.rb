# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "b35a1a8bad99cdfd6b1cba824a70cd51c7aa7e74"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/b35a1a8bad99cdfd6b1cba824a70cd51c7aa7e74/typedb-all-mac-arm64-b35a1a8bad99cdfd6b1cba824a70cd51c7aa7e74.zip"
    sha256 "5ee7fc8ccc65fc87cbdce6c954073713b90e383ca17da5a1840581d8dcfe22f3"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/b35a1a8bad99cdfd6b1cba824a70cd51c7aa7e74/typedb-all-mac-x86_64-b35a1a8bad99cdfd6b1cba824a70cd51c7aa7e74.zip"
    sha256 "c111c5f2c0e2ee92883c34ff1928cd4ac2c77786abf06fb7dd6b38d8a40eaa10"
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
