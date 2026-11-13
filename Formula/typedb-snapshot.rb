# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "d3e0e85b4b89bc3ec8c7ac61bbc44bdded18dc07"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/d3e0e85b4b89bc3ec8c7ac61bbc44bdded18dc07/typedb-all-mac-arm64-d3e0e85b4b89bc3ec8c7ac61bbc44bdded18dc07.zip"
    sha256 "6da22b4135a85daabc1909be596eb9eaf56aaf87a253ac385f052554fb71e92e"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/d3e0e85b4b89bc3ec8c7ac61bbc44bdded18dc07/typedb-all-mac-x86_64-d3e0e85b4b89bc3ec8c7ac61bbc44bdded18dc07.zip"
    sha256 "0991fe26abc075333ea8ad3b40d75cc703ca65d5163f8ffc9f6f1904cff6e966"
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
