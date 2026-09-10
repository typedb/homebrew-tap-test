# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "66180f948b30a3163b380cde50b14945348501f1"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/66180f948b30a3163b380cde50b14945348501f1/typedb-all-mac-arm64-66180f948b30a3163b380cde50b14945348501f1.zip"
    sha256 "ddf4ad2c7bb19a425370e15cba5e0cd652022af0a0e6f86792161bfc282aafbb"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/66180f948b30a3163b380cde50b14945348501f1/typedb-all-mac-x86_64-66180f948b30a3163b380cde50b14945348501f1.zip"
    sha256 "bf6c0827780ccce604075f6d1ddbd8149298ccb81e4cdc79218a2530a2e914dc"
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
