# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "bcf3dc1108848c554e842aec700d84308993285b"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/bcf3dc1108848c554e842aec700d84308993285b/typedb-all-mac-arm64-bcf3dc1108848c554e842aec700d84308993285b.zip"
    sha256 "4889464e13f1fca6dbb3f7e819a3054b51889792293b54d148de35b0f1eb98e6"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/bcf3dc1108848c554e842aec700d84308993285b/typedb-all-mac-x86_64-bcf3dc1108848c554e842aec700d84308993285b.zip"
    sha256 "41a3d7372a9032071293751ad5aed8ae8cce3a885b4454596567f8497cf3d8fe"
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
