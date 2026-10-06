# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "50db33211adaf73651538addf3020e7260ead6dc"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/50db33211adaf73651538addf3020e7260ead6dc/typedb-all-mac-arm64-50db33211adaf73651538addf3020e7260ead6dc.zip"
    sha256 "38a59c56b635da56778c1668b39a65b31ff7be78a27ede3cb65fc096f42bb7c0"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/50db33211adaf73651538addf3020e7260ead6dc/typedb-all-mac-x86_64-50db33211adaf73651538addf3020e7260ead6dc.zip"
    sha256 "520f7fe91314094ce268070d8eed8e7106c68a7cbf932b890422a20387f9b35a"
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
