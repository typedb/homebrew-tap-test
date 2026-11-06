# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "5bf0231ef2308caec64c74adf5b6e9ed00af4dc9"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5bf0231ef2308caec64c74adf5b6e9ed00af4dc9/typedb-all-mac-arm64-5bf0231ef2308caec64c74adf5b6e9ed00af4dc9.zip"
    sha256 "f353707559c3b9555296514882140d87ab9b26821d473bb3064fc83d28fb9b5d"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5bf0231ef2308caec64c74adf5b6e9ed00af4dc9/typedb-all-mac-x86_64-5bf0231ef2308caec64c74adf5b6e9ed00af4dc9.zip"
    sha256 "df6bcc7f6e1bbfd7bf68b76c02bce553962cbf66321f9ad1cc2a34472ed13d83"
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
