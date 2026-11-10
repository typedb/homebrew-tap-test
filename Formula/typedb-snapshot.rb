# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a99f0e280829a18289d3d076d23309d46e9888d9"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a99f0e280829a18289d3d076d23309d46e9888d9/typedb-all-mac-arm64-a99f0e280829a18289d3d076d23309d46e9888d9.zip"
    sha256 "6d316645a698fbd7a264bd3b5511992ae035ab2c78a3e57224df789a9522209d"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a99f0e280829a18289d3d076d23309d46e9888d9/typedb-all-mac-x86_64-a99f0e280829a18289d3d076d23309d46e9888d9.zip"
    sha256 "0655135750fcc208cd0e3c469947b3d2e35e1c4678690379c3648422285dba74"
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
