# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "d3c2c6d70eee4f6618931a9ce1cf7fda4e2bf0d4"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/d3c2c6d70eee4f6618931a9ce1cf7fda4e2bf0d4/typedb-all-mac-arm64-d3c2c6d70eee4f6618931a9ce1cf7fda4e2bf0d4.zip"
    sha256 "907e9ceaf4333e0cbcae2a4dec49d64230d24efbbb793341b6d30044f4e37296"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/d3c2c6d70eee4f6618931a9ce1cf7fda4e2bf0d4/typedb-all-mac-x86_64-d3c2c6d70eee4f6618931a9ce1cf7fda4e2bf0d4.zip"
    sha256 "00421534f3a539742e0386da5f883fdfcaade26fd3f5d7dbe06d74f52c8ab7ed"
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
