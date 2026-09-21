# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "ed7f105a8bdb0fe6543ba953e401f8be6f9a8c4a"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ed7f105a8bdb0fe6543ba953e401f8be6f9a8c4a/typedb-all-mac-arm64-ed7f105a8bdb0fe6543ba953e401f8be6f9a8c4a.zip"
    sha256 "431ca43bf44569720347ebea947551b18d11224eacccaa5bc9fc3d561f57c8ee"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ed7f105a8bdb0fe6543ba953e401f8be6f9a8c4a/typedb-all-mac-x86_64-ed7f105a8bdb0fe6543ba953e401f8be6f9a8c4a.zip"
    sha256 "524575fef4a6f3aa7e485d1dcf10621ec33235375ddba0c5fe62ae8698352178"
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
