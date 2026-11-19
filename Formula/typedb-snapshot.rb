# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a2da3ff3908fa5740c826ae8f80467351a468e38"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a2da3ff3908fa5740c826ae8f80467351a468e38/typedb-all-mac-arm64-a2da3ff3908fa5740c826ae8f80467351a468e38.zip"
    sha256 "a6e26cf8fcd7541bbb3830e7d7c0ba5d56cd7b85dad562cbc9354da8e25e635c"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a2da3ff3908fa5740c826ae8f80467351a468e38/typedb-all-mac-x86_64-a2da3ff3908fa5740c826ae8f80467351a468e38.zip"
    sha256 "4b7b3c70c738c144d54d9c50caf12a7daf4173bf1df7445288199511c0e18d21"
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
