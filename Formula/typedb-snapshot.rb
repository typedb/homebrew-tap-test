# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "0dfacc44b368ef35b0eb5e690d057e9d6c221c40"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/0dfacc44b368ef35b0eb5e690d057e9d6c221c40/typedb-all-mac-arm64-0dfacc44b368ef35b0eb5e690d057e9d6c221c40.zip"
    sha256 "a964726b46b85a618506f883d9895ec6b0736c700a7a255446216f04dede59af"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/0dfacc44b368ef35b0eb5e690d057e9d6c221c40/typedb-all-mac-x86_64-0dfacc44b368ef35b0eb5e690d057e9d6c221c40.zip"
    sha256 "8e4de9f6247bb209f1f5c1de172f204da7a91469da616d8b969d375282d48ca6"
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
