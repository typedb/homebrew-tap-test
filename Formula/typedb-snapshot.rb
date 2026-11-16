# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "7ce571ccffef02674820fc28a843a8d9f3edf826"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/7ce571ccffef02674820fc28a843a8d9f3edf826/typedb-all-mac-arm64-7ce571ccffef02674820fc28a843a8d9f3edf826.zip"
    sha256 "61f86bebda49ef1f119d56989ae3983809cb2206e5c42ac4b22e9aac801dbb5c"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/7ce571ccffef02674820fc28a843a8d9f3edf826/typedb-all-mac-x86_64-7ce571ccffef02674820fc28a843a8d9f3edf826.zip"
    sha256 "350b16295937135af751328ddbd3a56c4da57144c6232f18cd635f936e729f56"
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
