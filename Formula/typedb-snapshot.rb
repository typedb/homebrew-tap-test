# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "79182c322f909ab0370079d62f90cad807aac47f"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/79182c322f909ab0370079d62f90cad807aac47f/typedb-all-mac-arm64-79182c322f909ab0370079d62f90cad807aac47f.zip"
    sha256 "b582c579cc16053409cef6565f02dc5b4aacee8b3b4ad93e9f362366c4e639e9"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/79182c322f909ab0370079d62f90cad807aac47f/typedb-all-mac-x86_64-79182c322f909ab0370079d62f90cad807aac47f.zip"
    sha256 "fef97ba146e7aa169378658411f09d393bcdda3664fada504e455e8fe4a72702"
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
