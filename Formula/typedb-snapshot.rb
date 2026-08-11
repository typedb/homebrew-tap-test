# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "7008cb4abdc2121758cce2e92c9ca5c8a7afe195"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/7008cb4abdc2121758cce2e92c9ca5c8a7afe195/typedb-all-mac-arm64-7008cb4abdc2121758cce2e92c9ca5c8a7afe195.zip"
    sha256 "2a56e206af2eeea55f6287088822bfd70de67a4fc3e41004970f727091bfef23"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/7008cb4abdc2121758cce2e92c9ca5c8a7afe195/typedb-all-mac-x86_64-7008cb4abdc2121758cce2e92c9ca5c8a7afe195.zip"
    sha256 "67ffa88efa50399212511875534c601e8f43d3c766e33ea3d63625085f6e4ea5"
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
