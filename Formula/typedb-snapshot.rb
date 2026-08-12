# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a5a15bd195f8af262e6243cfd1db619ab53ae94e"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a5a15bd195f8af262e6243cfd1db619ab53ae94e/typedb-all-mac-arm64-a5a15bd195f8af262e6243cfd1db619ab53ae94e.zip"
    sha256 "68948408577bc6b88c5e3649ec75b009b52b1a20f93ec78ec75a6b146ec4eb38"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a5a15bd195f8af262e6243cfd1db619ab53ae94e/typedb-all-mac-x86_64-a5a15bd195f8af262e6243cfd1db619ab53ae94e.zip"
    sha256 "31e970515a03cee6ed7e99051213a8820b3ae32fec83b72c372b94749a137498"
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
