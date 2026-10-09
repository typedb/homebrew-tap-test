# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "90cef26d66a2a2b59e4b52c80b51c41edf85cc8c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/90cef26d66a2a2b59e4b52c80b51c41edf85cc8c/typedb-all-mac-arm64-90cef26d66a2a2b59e4b52c80b51c41edf85cc8c.zip"
    sha256 "1ea05694182aa772758aa7021f1ab5650343a3a40ccde571431cd0d8b06cc2b5"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/90cef26d66a2a2b59e4b52c80b51c41edf85cc8c/typedb-all-mac-x86_64-90cef26d66a2a2b59e4b52c80b51c41edf85cc8c.zip"
    sha256 "67c25865d42e7b1e597107fa8a34f2dd0725f5e87d7648d73010dd2acb2681d8"
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
