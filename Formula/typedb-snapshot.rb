# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "43f63ec03c1a2989a9210f7a7fce21ec4b0b3447"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/43f63ec03c1a2989a9210f7a7fce21ec4b0b3447/typedb-all-mac-arm64-43f63ec03c1a2989a9210f7a7fce21ec4b0b3447.zip"
    sha256 "dcbfaa222eaccfd1b6c394910b872b88d7b354890e555eadaccab8e4ad5f54aa"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/43f63ec03c1a2989a9210f7a7fce21ec4b0b3447/typedb-all-mac-x86_64-43f63ec03c1a2989a9210f7a7fce21ec4b0b3447.zip"
    sha256 "22621ceb4ac6dda278bc2b4d2ea955bd4ec52ea822fa3dbba1f580f6705dc888"
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
