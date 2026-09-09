# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "7cb72682ec51cf4ca11212a6780a5a061c37eb37"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/7cb72682ec51cf4ca11212a6780a5a061c37eb37/typedb-all-mac-arm64-7cb72682ec51cf4ca11212a6780a5a061c37eb37.zip"
    sha256 "6f40c07665ea91f99e348ba56413db5db94ac9e0ef3228e7221c5c97205a428f"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/7cb72682ec51cf4ca11212a6780a5a061c37eb37/typedb-all-mac-x86_64-7cb72682ec51cf4ca11212a6780a5a061c37eb37.zip"
    sha256 "b82e5af5e054961d8f49cfc3e01cd3eb34c1cdf04ad72415c0d0a6f3784be667"
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
