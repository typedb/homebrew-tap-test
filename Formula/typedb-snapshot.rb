# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "98220b40524a5ce1adb7f845f23ee5b29a03bf24"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/98220b40524a5ce1adb7f845f23ee5b29a03bf24/typedb-all-mac-arm64-98220b40524a5ce1adb7f845f23ee5b29a03bf24.zip"
    sha256 "9c764a721b388d0ee64edc34040bb37fe2dee37283930ad9070277cf39d1c73e"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/98220b40524a5ce1adb7f845f23ee5b29a03bf24/typedb-all-mac-x86_64-98220b40524a5ce1adb7f845f23ee5b29a03bf24.zip"
    sha256 "32b958b8f52721c981414c03ecf5cd06dfad1a93dcca7104c45aa32a5c42213c"
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
