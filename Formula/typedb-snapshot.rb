# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "6d4e013cbbcb07185095b94dfd8c42f6002bd42c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/6d4e013cbbcb07185095b94dfd8c42f6002bd42c/typedb-all-mac-arm64-6d4e013cbbcb07185095b94dfd8c42f6002bd42c.zip"
    sha256 "b6bd0b5ce8bd24f0c77158444f01027ff8c3534c3f98f7fa86e94714034acd10"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/6d4e013cbbcb07185095b94dfd8c42f6002bd42c/typedb-all-mac-x86_64-6d4e013cbbcb07185095b94dfd8c42f6002bd42c.zip"
    sha256 "e2e1a5414c34e6d2eda3c5657643bfb47256f39e468c77d120db7aa7fb04d09f"
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
