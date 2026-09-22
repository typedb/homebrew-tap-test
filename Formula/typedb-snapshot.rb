# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "d93a19cc8a7de0bafea7f13d8c4871602d0a98eb"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/d93a19cc8a7de0bafea7f13d8c4871602d0a98eb/typedb-all-mac-arm64-d93a19cc8a7de0bafea7f13d8c4871602d0a98eb.zip"
    sha256 "21a8c1371b7f9bd0ba140a9b5fca84ee23b19542d14197385ae7c33de109a932"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/d93a19cc8a7de0bafea7f13d8c4871602d0a98eb/typedb-all-mac-x86_64-d93a19cc8a7de0bafea7f13d8c4871602d0a98eb.zip"
    sha256 "5df51c907f40223782b5432363c2f6cee9a36fcd12b8c686a8ba95cdc507b96e"
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
