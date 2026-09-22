# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "fa09a99f8f804877c4ebe7918265d2e17cb8e241"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/fa09a99f8f804877c4ebe7918265d2e17cb8e241/typedb-all-mac-arm64-fa09a99f8f804877c4ebe7918265d2e17cb8e241.zip"
    sha256 "cf91f133cde831f8d22f56702d9631718bce4ad380ed6ba3e3759abda74306ea"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/fa09a99f8f804877c4ebe7918265d2e17cb8e241/typedb-all-mac-x86_64-fa09a99f8f804877c4ebe7918265d2e17cb8e241.zip"
    sha256 "ad72b9e727c2bc09454d24d89e5a8356a9f032851dbc1c132d9ba38e93530f99"
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
