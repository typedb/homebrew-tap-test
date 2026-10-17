# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "5da9d2b951f499bb0d62d8c261b525788f354f53"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5da9d2b951f499bb0d62d8c261b525788f354f53/typedb-all-mac-arm64-5da9d2b951f499bb0d62d8c261b525788f354f53.zip"
    sha256 "ec73937d85495a74de62416e371819207c332b39be818c85fb4eba0b318c3f29"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5da9d2b951f499bb0d62d8c261b525788f354f53/typedb-all-mac-x86_64-5da9d2b951f499bb0d62d8c261b525788f354f53.zip"
    sha256 "efa07a9371d4dd7153053f418126032f3506520c58f2ea2ec173c151011b5457"
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
