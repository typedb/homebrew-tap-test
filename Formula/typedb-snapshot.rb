# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "2faef80cff9437305f0564a7a9d8f3a54545ed03"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/2faef80cff9437305f0564a7a9d8f3a54545ed03/typedb-all-mac-arm64-2faef80cff9437305f0564a7a9d8f3a54545ed03.zip"
    sha256 "d2691a4c989bdaee29260ca37c11d001f31a30bfbc12c8135fc60dd32a2e7d9f"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/2faef80cff9437305f0564a7a9d8f3a54545ed03/typedb-all-mac-x86_64-2faef80cff9437305f0564a7a9d8f3a54545ed03.zip"
    sha256 "64f0f8d83b3815b394b6e9001d9ae23bc98ee93b6dccf5c265a6edfb2a8834e0"
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
