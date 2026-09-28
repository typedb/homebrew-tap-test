# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "88f02dbcbfe9f5564cbf871516887c2a46baf70b"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/88f02dbcbfe9f5564cbf871516887c2a46baf70b/typedb-all-mac-arm64-88f02dbcbfe9f5564cbf871516887c2a46baf70b.zip"
    sha256 "84060d44a672b5cedc438b203a74e202c9a1aca08c76fe9bdef6ca79b451cfae"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/88f02dbcbfe9f5564cbf871516887c2a46baf70b/typedb-all-mac-x86_64-88f02dbcbfe9f5564cbf871516887c2a46baf70b.zip"
    sha256 "b75351831b3fb0f15ea81365e26bdb99d775fde3b375376cb75ddb118b31dfb2"
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
