# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "dcb54e77dcce1ddea19ba9f3a0aeaca28f4b8e71"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/dcb54e77dcce1ddea19ba9f3a0aeaca28f4b8e71/typedb-all-mac-arm64-dcb54e77dcce1ddea19ba9f3a0aeaca28f4b8e71.zip"
    sha256 "14bbb77dc7869d41335bb12893f2df6cde227a15c7de1697f5a7aa79ba2618a8"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/dcb54e77dcce1ddea19ba9f3a0aeaca28f4b8e71/typedb-all-mac-x86_64-dcb54e77dcce1ddea19ba9f3a0aeaca28f4b8e71.zip"
    sha256 "3abd69fd11f79348ae5f9354f354e5343d9d0c88f96053cd97f8100320f469f1"
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
