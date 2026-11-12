# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "28ec72b8ffa5db213dd6106d21bf99910aaed6ee"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/28ec72b8ffa5db213dd6106d21bf99910aaed6ee/typedb-all-mac-arm64-28ec72b8ffa5db213dd6106d21bf99910aaed6ee.zip"
    sha256 "8b057429863056980ea85175e24c664300037976cfa20aae5cf444e1499c607b"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/28ec72b8ffa5db213dd6106d21bf99910aaed6ee/typedb-all-mac-x86_64-28ec72b8ffa5db213dd6106d21bf99910aaed6ee.zip"
    sha256 "30a1ee8faa65785dcbb2d2d4fbb3f3308fe5d6da489e1681c54b2495de79d671"
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
