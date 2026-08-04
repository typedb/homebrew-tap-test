# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "b199b4ec6f26c88b8ab4efc70a21582203a90454"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/b199b4ec6f26c88b8ab4efc70a21582203a90454/typedb-all-mac-arm64-b199b4ec6f26c88b8ab4efc70a21582203a90454.zip"
    sha256 "c33d864a2b3c9d9b6c81ad294975f5632e71cadcaa15152fa57403c6cb15400f"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/b199b4ec6f26c88b8ab4efc70a21582203a90454/typedb-all-mac-x86_64-b199b4ec6f26c88b8ab4efc70a21582203a90454.zip"
    sha256 "d2f97eef1887011e89d1df8beaa7f3874cd1bf5b544269df63d8ceda84dafa92"
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
