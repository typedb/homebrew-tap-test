# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "4aeadeef9f0fafb87f140c927fae1d971b02ce6a"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/4aeadeef9f0fafb87f140c927fae1d971b02ce6a/typedb-all-mac-arm64-4aeadeef9f0fafb87f140c927fae1d971b02ce6a.zip"
    sha256 "064e41e8308c944f6bcf5957859c1b228971f2171a59dd9d66563cd0b8f3560a"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/4aeadeef9f0fafb87f140c927fae1d971b02ce6a/typedb-all-mac-x86_64-4aeadeef9f0fafb87f140c927fae1d971b02ce6a.zip"
    sha256 "55b94d6acd1545dced3580dadc3a62106e88e738c8048108ac7719b4aaa61f75"
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
