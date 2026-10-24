# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "a3df07ef965a4ea04c238f5d3044df60262c8391"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/a3df07ef965a4ea04c238f5d3044df60262c8391/typedb-all-mac-arm64-a3df07ef965a4ea04c238f5d3044df60262c8391.zip"
    sha256 "47717cc71e41a6748af355d1ecb2ee42a34d4d8654d2006865417d12036edcef"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/a3df07ef965a4ea04c238f5d3044df60262c8391/typedb-all-mac-x86_64-a3df07ef965a4ea04c238f5d3044df60262c8391.zip"
    sha256 "38c7badcbc65d16cd6d85b0fba68f1333f2c509bc34ed8c1f1b0f5150eee4863"
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
