# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "5e8eadf383d588a7de28249185c9d1d667e41f5d"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5e8eadf383d588a7de28249185c9d1d667e41f5d/typedb-all-mac-arm64-5e8eadf383d588a7de28249185c9d1d667e41f5d.zip"
    sha256 "a092c5eb0ba38ea4e7e5e06a6c75c8fef4f6eab9dfdd301f58dc2bff2b35318f"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5e8eadf383d588a7de28249185c9d1d667e41f5d/typedb-all-mac-x86_64-5e8eadf383d588a7de28249185c9d1d667e41f5d.zip"
    sha256 "ca3d4560eb6e0b7a0dfd92206fe1fe5baed1e63aba69b179eff8e49328647918"
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
