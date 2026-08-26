# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "31e0a567c4fc268643d9d2fd4816d4e36db30f6a"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/31e0a567c4fc268643d9d2fd4816d4e36db30f6a/typedb-all-mac-arm64-31e0a567c4fc268643d9d2fd4816d4e36db30f6a.zip"
    sha256 "319d4167ecad507b3d76ec4837054a98ac6d026ab16fd2e72f8b3e7553f9bb2c"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/31e0a567c4fc268643d9d2fd4816d4e36db30f6a/typedb-all-mac-x86_64-31e0a567c4fc268643d9d2fd4816d4e36db30f6a.zip"
    sha256 "694566eb6c619cea4ff131091579ce4c7899cf281bf4a8381fa2316a6a88437a"
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
