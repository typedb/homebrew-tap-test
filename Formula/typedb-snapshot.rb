# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/b335e112d5dd833ed670ec2b3dc268ae5e3c6d2e/typedb-all-mac-arm64-b335e112d5dd833ed670ec2b3dc268ae5e3c6d2e.zip"
    sha256 "03a68d7547c1be32f199aac9e9dd70bc8ede6f2fcba7e6753df9c6621f4524d7"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/b335e112d5dd833ed670ec2b3dc268ae5e3c6d2e/typedb-all-mac-x86_64-b335e112d5dd833ed670ec2b3dc268ae5e3c6d2e.zip"
    sha256 "33ff1268da20c0dce88f38e1f514afd702aa5b2aa1e4eee917a67527ec79945f"
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
