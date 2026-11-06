# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "def8b6aad490dfa98699301621a3e78727f934d6"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/def8b6aad490dfa98699301621a3e78727f934d6/typedb-all-mac-arm64-def8b6aad490dfa98699301621a3e78727f934d6.zip"
    sha256 "7de30d99a56e47b5b254f193d8d4721e91b954c855aadb9bfd4f5f1fe238ae18"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/def8b6aad490dfa98699301621a3e78727f934d6/typedb-all-mac-x86_64-def8b6aad490dfa98699301621a3e78727f934d6.zip"
    sha256 "7d9b7ce1e755b0f955c2e6298c9641e6f5b4a8fb2534b7dd4971d7c4f94bf3fc"
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
