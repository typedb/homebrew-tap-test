# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "4406578817018d37198615c26af70b87d8d310ba"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/4406578817018d37198615c26af70b87d8d310ba/typedb-all-mac-arm64-4406578817018d37198615c26af70b87d8d310ba.zip"
    sha256 "45e4327e5cbf7494222ca53a46e0429f1c528f720a34aa17b4566a3910c1ee4f"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/4406578817018d37198615c26af70b87d8d310ba/typedb-all-mac-x86_64-4406578817018d37198615c26af70b87d8d310ba.zip"
    sha256 "e66bdb23b8105921d9d25042dd0825f358f5a765271430cd494486efb2f3a876"
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
