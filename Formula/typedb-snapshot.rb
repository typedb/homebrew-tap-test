# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "6588ef0ffbe0f36d47bee3edb595143ceda1592e"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/6588ef0ffbe0f36d47bee3edb595143ceda1592e/typedb-all-mac-arm64-6588ef0ffbe0f36d47bee3edb595143ceda1592e.zip"
    sha256 "5ddb2555a2b70f48b23ea0125c1edd9adfd81a87484b462105f94e977e1bd338"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/6588ef0ffbe0f36d47bee3edb595143ceda1592e/typedb-all-mac-x86_64-6588ef0ffbe0f36d47bee3edb595143ceda1592e.zip"
    sha256 "77d9379492782622531a83c3c78186ddcd98d3699c9bf7bf9cca0d572a0a9654"
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
