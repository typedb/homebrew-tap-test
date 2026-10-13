# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "626245aa954f6be52382febf6cc2e6901c43e20c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/626245aa954f6be52382febf6cc2e6901c43e20c/typedb-all-mac-arm64-626245aa954f6be52382febf6cc2e6901c43e20c.zip"
    sha256 "2a2b8634206f262d7fb587905dadbc473cc8b7773f66574c619a89c4625b5483"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/626245aa954f6be52382febf6cc2e6901c43e20c/typedb-all-mac-x86_64-626245aa954f6be52382febf6cc2e6901c43e20c.zip"
    sha256 "66ca7cdfa4f3ea957211261000e2caf5600ab03a6c392ebb31ec03022f56cd57"
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
