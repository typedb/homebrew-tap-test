# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "1210089f61b78a0f68db9393554e8abd1b39b27a"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/1210089f61b78a0f68db9393554e8abd1b39b27a/typedb-all-mac-arm64-1210089f61b78a0f68db9393554e8abd1b39b27a.zip"
    sha256 "8861eef65d5ef120f19c10ff7f402e61fe2a82472d78966d3303545f31bab5a3"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/1210089f61b78a0f68db9393554e8abd1b39b27a/typedb-all-mac-x86_64-1210089f61b78a0f68db9393554e8abd1b39b27a.zip"
    sha256 "05efd3680ccceb81ac7465a998f3a63401c93a6f9a07c66e86e517ce7f211eba"
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
