# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "4ec9021496ab7524d309cab34761107e32c0ccfd"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/4ec9021496ab7524d309cab34761107e32c0ccfd/typedb-all-mac-arm64-4ec9021496ab7524d309cab34761107e32c0ccfd.zip"
    sha256 "d3643257d5e9e3838cd8f45a7dd94b32b331aebf3c48a3823693657b970836d2"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/4ec9021496ab7524d309cab34761107e32c0ccfd/typedb-all-mac-x86_64-4ec9021496ab7524d309cab34761107e32c0ccfd.zip"
    sha256 "22f507e85d9a93df6f5be9e4b7dcf7889a4c8f8a51e1b93237ed3da959c30284"
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
