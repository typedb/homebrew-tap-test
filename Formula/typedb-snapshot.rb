# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "39df61004e81cedbd85e4dd9448eb7cb69600410"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/39df61004e81cedbd85e4dd9448eb7cb69600410/typedb-all-mac-arm64-39df61004e81cedbd85e4dd9448eb7cb69600410.zip"
    sha256 "fc8c2d0399211b0f72e6882b4016684ce8653e01259563cadac9e4a939970690"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/39df61004e81cedbd85e4dd9448eb7cb69600410/typedb-all-mac-x86_64-39df61004e81cedbd85e4dd9448eb7cb69600410.zip"
    sha256 "83f1ce1d9ee41e5a3fd3b31e9429778d789e800486edc7dd37dd5671b0c2fbf4"
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
