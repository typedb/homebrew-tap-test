# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a9051fbcc241390d15864f3564bfd525f7dce777"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a9051fbcc241390d15864f3564bfd525f7dce777/typedb-all-mac-arm64-a9051fbcc241390d15864f3564bfd525f7dce777.zip"
    sha256 "ca2c71604a631805f5871db821b063cc5ecfc9ba54d4ff86f8e556391f54d9c6"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a9051fbcc241390d15864f3564bfd525f7dce777/typedb-all-mac-x86_64-a9051fbcc241390d15864f3564bfd525f7dce777.zip"
    sha256 "566ff897db4e92f9089f9b317a1e10f69fe62c8965a8f912d00254a66055fc3c"
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
