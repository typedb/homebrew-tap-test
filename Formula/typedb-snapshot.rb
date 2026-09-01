# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "ac9cedc889a2ff18343db636e3c4ba6945872cc5"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/ac9cedc889a2ff18343db636e3c4ba6945872cc5/typedb-all-mac-arm64-ac9cedc889a2ff18343db636e3c4ba6945872cc5.zip"
    sha256 "8038bc20ea6b6af646571443770fae64d22091479fadb4f677116fc147a5fa5b"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/ac9cedc889a2ff18343db636e3c4ba6945872cc5/typedb-all-mac-x86_64-ac9cedc889a2ff18343db636e3c4ba6945872cc5.zip"
    sha256 "0f18069d91d85901f61d4755ba520752d3a44205e4a9d884117726143dc8464b"
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
