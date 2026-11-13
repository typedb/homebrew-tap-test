# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "96f113903329d7fd70482c53f82ab30d9650a0ed"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/96f113903329d7fd70482c53f82ab30d9650a0ed/typedb-all-mac-arm64-96f113903329d7fd70482c53f82ab30d9650a0ed.zip"
    sha256 "387ee3d50db37dacd920f85e3db8b053ed13b2400a5ff7e4b9383bfb6333f572"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/96f113903329d7fd70482c53f82ab30d9650a0ed/typedb-all-mac-x86_64-96f113903329d7fd70482c53f82ab30d9650a0ed.zip"
    sha256 "eaa5c90aea61d5f2443cf709acc3cee77b38ae7b06b515b0f9c42bd608c9ebd0"
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
