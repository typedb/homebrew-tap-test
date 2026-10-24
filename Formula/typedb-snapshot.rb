# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "fe883d1b038ec40a0ab203d8781c9b684deb37be"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/fe883d1b038ec40a0ab203d8781c9b684deb37be/typedb-all-mac-arm64-fe883d1b038ec40a0ab203d8781c9b684deb37be.zip"
    sha256 "4a54e039c8fef4ceedf76950cd416b6e2d6afe04ec4987c263ecd02eafb71a98"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/fe883d1b038ec40a0ab203d8781c9b684deb37be/typedb-all-mac-x86_64-fe883d1b038ec40a0ab203d8781c9b684deb37be.zip"
    sha256 "f592ef21a2ba7cb41b92d0814201bbd25963654eb8a961a4507a131f5650408a"
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
