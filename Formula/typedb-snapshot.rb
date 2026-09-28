# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "27aade0cfdc6b4bc03205a5a35d2730cd7211568"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/27aade0cfdc6b4bc03205a5a35d2730cd7211568/typedb-all-mac-arm64-27aade0cfdc6b4bc03205a5a35d2730cd7211568.zip"
    sha256 "0829f3b69bdb73db9b7699eee4235b217d2d39a5267352f37e6d4d56562462f3"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/27aade0cfdc6b4bc03205a5a35d2730cd7211568/typedb-all-mac-x86_64-27aade0cfdc6b4bc03205a5a35d2730cd7211568.zip"
    sha256 "7a7755f1a9f273d68daebd5fc3dc63d2a1d67d289c9a8cff93989823c6b676c7"
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
