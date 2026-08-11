# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "7975eba49f11108af72de093a45bfac9e4887900"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/7975eba49f11108af72de093a45bfac9e4887900/typedb-all-mac-arm64-7975eba49f11108af72de093a45bfac9e4887900.zip"
    sha256 "6232c081b99d93f6504129a1eeb06ea9fb953e5d2c0e442489099a05adf52e2b"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/7975eba49f11108af72de093a45bfac9e4887900/typedb-all-mac-x86_64-7975eba49f11108af72de093a45bfac9e4887900.zip"
    sha256 "e494d5e7d4001a02f0490d7d8446af0a6d11e9c18612a7feaf660d52ad10de35"
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
