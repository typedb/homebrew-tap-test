# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "095535530e0b8152c7c91351afe530cccf3eb872"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/095535530e0b8152c7c91351afe530cccf3eb872/typedb-all-mac-arm64-095535530e0b8152c7c91351afe530cccf3eb872.zip"
    sha256 "bdfc63609e6bdf193c662484988cabcd6613e8d1b8f6dca887d6499b410f2fcc"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/095535530e0b8152c7c91351afe530cccf3eb872/typedb-all-mac-x86_64-095535530e0b8152c7c91351afe530cccf3eb872.zip"
    sha256 "0bf757b07d8b502cce07f96897e0ce6161b41cdce3ef88137958a64914e9a592"
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
