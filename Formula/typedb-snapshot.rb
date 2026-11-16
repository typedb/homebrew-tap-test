# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "0a759167c3aa08095eb6417b0f8e6991de0a87d7"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/0a759167c3aa08095eb6417b0f8e6991de0a87d7/typedb-all-mac-arm64-0a759167c3aa08095eb6417b0f8e6991de0a87d7.zip"
    sha256 "18ed295056921a0b09b847cf63cd14c94f46b75908ce48e594f99f27c3e9c000"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/0a759167c3aa08095eb6417b0f8e6991de0a87d7/typedb-all-mac-x86_64-0a759167c3aa08095eb6417b0f8e6991de0a87d7.zip"
    sha256 "7389d4a4dde2ba528dc0e02969e7d1ed967258c34e1f296a02c6fc6e2c80fc84"
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
