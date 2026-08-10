# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "6faa67d16ea270386da1312f5e78b7742875b3f9"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/6faa67d16ea270386da1312f5e78b7742875b3f9/typedb-all-mac-arm64-6faa67d16ea270386da1312f5e78b7742875b3f9.zip"
    sha256 "73307766090fe0d1a3d0f13f68d58030138e46f90adc4c2d498cd886ad6fdf9c"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/6faa67d16ea270386da1312f5e78b7742875b3f9/typedb-all-mac-x86_64-6faa67d16ea270386da1312f5e78b7742875b3f9.zip"
    sha256 "eeccf09b5357e83053023025c07154b9e8a84932327842d14ac7dbbc3d938550"
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
