# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "78e9bc1a1f39f01a63e6b64f6a7835ebfe36bd1c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/78e9bc1a1f39f01a63e6b64f6a7835ebfe36bd1c/typedb-all-mac-arm64-78e9bc1a1f39f01a63e6b64f6a7835ebfe36bd1c.zip"
    sha256 "736659a9972ed0b06ea7b28184bba0beb3d35f27d4335775c6e881e04e10752b"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/78e9bc1a1f39f01a63e6b64f6a7835ebfe36bd1c/typedb-all-mac-x86_64-78e9bc1a1f39f01a63e6b64f6a7835ebfe36bd1c.zip"
    sha256 "b11e61923d7223d155eef335daa6f1b34ebb9ea5389cc04161a3a3a3c99ffab6"
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
