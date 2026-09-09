# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "04eb97f837beb78e24fd58ff29233e0b8609ec15"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/04eb97f837beb78e24fd58ff29233e0b8609ec15/typedb-all-mac-arm64-04eb97f837beb78e24fd58ff29233e0b8609ec15.zip"
    sha256 "76fda3e537e606e8c784be2fb877f51ad48cd47b5dd1f1b465c04a45a70bd0d3"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/04eb97f837beb78e24fd58ff29233e0b8609ec15/typedb-all-mac-x86_64-04eb97f837beb78e24fd58ff29233e0b8609ec15.zip"
    sha256 "55a8f0c3ed7840aa5d6db9631c630731a0514917f68ec4fedecde7a885aec15c"
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
