# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "ccc06565a024530b273180a95183c14635f0f7d7"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ccc06565a024530b273180a95183c14635f0f7d7/typedb-all-mac-arm64-ccc06565a024530b273180a95183c14635f0f7d7.zip"
    sha256 "de4022f075ddbdb3b344ed3bad9f8b4b7f2ff3884bb4d6cb2796a5e1b6b64d25"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ccc06565a024530b273180a95183c14635f0f7d7/typedb-all-mac-x86_64-ccc06565a024530b273180a95183c14635f0f7d7.zip"
    sha256 "859d87edb2f1290e48e00063cc71e546220116e67efce642f7c4f5d2ca34102c"
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
