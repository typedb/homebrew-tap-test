# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "77d1bd0e11fbd94fdebc5537573320e81d8b8bc5"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/77d1bd0e11fbd94fdebc5537573320e81d8b8bc5/typedb-all-mac-arm64-77d1bd0e11fbd94fdebc5537573320e81d8b8bc5.zip"
    sha256 "77912cfafdc930544fcd270c593c2ecb438b64712244b250a6393004132f699c"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/77d1bd0e11fbd94fdebc5537573320e81d8b8bc5/typedb-all-mac-x86_64-77d1bd0e11fbd94fdebc5537573320e81d8b8bc5.zip"
    sha256 "07591ffefc792c0b1964691d19db974ffff5c9be7949f1ac438bc1c62c9b2f6d"
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
