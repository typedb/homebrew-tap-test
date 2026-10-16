# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "6ed417959ad5fcd0cbbd93fd52d6fdcd8099b0c6"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/6ed417959ad5fcd0cbbd93fd52d6fdcd8099b0c6/typedb-all-mac-arm64-6ed417959ad5fcd0cbbd93fd52d6fdcd8099b0c6.zip"
    sha256 "84ab00309fe301890cda36e23bff7625670f5ad472af1cb728aef48c718d261a"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/6ed417959ad5fcd0cbbd93fd52d6fdcd8099b0c6/typedb-all-mac-x86_64-6ed417959ad5fcd0cbbd93fd52d6fdcd8099b0c6.zip"
    sha256 "36fa245d6043b840caf05320049069c4913517d91140b13c59af31b35f2b4601"
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
