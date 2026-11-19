# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "498c955373915d04779a239439260298dc3e742c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/498c955373915d04779a239439260298dc3e742c/typedb-all-mac-arm64-498c955373915d04779a239439260298dc3e742c.zip"
    sha256 "6fce2549af5e1374f25bd3185007d3e24bf37c1d65e151503afd457fc5d92a03"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/498c955373915d04779a239439260298dc3e742c/typedb-all-mac-x86_64-498c955373915d04779a239439260298dc3e742c.zip"
    sha256 "3f90b9f137c3ca353a18105a412f99a01fadc292936302e6b6bd823af0eae163"
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
