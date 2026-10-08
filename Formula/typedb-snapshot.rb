# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "d23412c9aae83ee74c1151e61bc1916b5bfd80f2"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/d23412c9aae83ee74c1151e61bc1916b5bfd80f2/typedb-all-mac-arm64-d23412c9aae83ee74c1151e61bc1916b5bfd80f2.zip"
    sha256 "afee46f4e17b68a0c01cdaafc499f7aacf9a0427375b5462d6d44b8f72207bae"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/d23412c9aae83ee74c1151e61bc1916b5bfd80f2/typedb-all-mac-x86_64-d23412c9aae83ee74c1151e61bc1916b5bfd80f2.zip"
    sha256 "16a0f44e87e3b7ee563131231b7f0d8e1eba0a87ab95580464e4869e21245fdc"
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
