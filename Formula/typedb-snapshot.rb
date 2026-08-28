# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "83476cd0d9e8705a651b55532c6d6c111d606425"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/83476cd0d9e8705a651b55532c6d6c111d606425/typedb-all-mac-arm64-83476cd0d9e8705a651b55532c6d6c111d606425.zip"
    sha256 "b8c8b594b932abd7fab61b92d89a4be99798f15682734c12cc3e5c25185c2df8"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/83476cd0d9e8705a651b55532c6d6c111d606425/typedb-all-mac-x86_64-83476cd0d9e8705a651b55532c6d6c111d606425.zip"
    sha256 "064316b829d79c443134f5e9d47cdbfb4dabf963303a5c0fae60d9f730db5212"
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
