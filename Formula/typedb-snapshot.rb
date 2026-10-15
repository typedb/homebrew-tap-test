# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "67817d4aa13821fcbd0a1d86b96dd4853ca4615e"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/67817d4aa13821fcbd0a1d86b96dd4853ca4615e/typedb-all-mac-arm64-67817d4aa13821fcbd0a1d86b96dd4853ca4615e.zip"
    sha256 "6881738c757cb927ce28c9c056ace1bc5bee3027105ca544aedf06ad1b01e809"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/67817d4aa13821fcbd0a1d86b96dd4853ca4615e/typedb-all-mac-x86_64-67817d4aa13821fcbd0a1d86b96dd4853ca4615e.zip"
    sha256 "63fca2f196d14bb756b7be0bf38547250a7cb2ec7f27ccb94b989a7c9778c0a8"
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
