# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "ff881372935a6420a212b79290c00826766ef276"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ff881372935a6420a212b79290c00826766ef276/typedb-all-mac-arm64-ff881372935a6420a212b79290c00826766ef276.zip"
    sha256 "9142bfbed17bd51547bfbc6c5cca96a4e027bd3475f0b2dfd843a369ff058fe9"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ff881372935a6420a212b79290c00826766ef276/typedb-all-mac-x86_64-ff881372935a6420a212b79290c00826766ef276.zip"
    sha256 "dc3fdb8c956cb41cba4e1fed2d6ace6879330e241e10765575c59d25de8f7c7d"
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
