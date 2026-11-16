# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "fb7c1cced20d62362ab823e43f04d46200b123f0"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/fb7c1cced20d62362ab823e43f04d46200b123f0/typedb-all-mac-arm64-fb7c1cced20d62362ab823e43f04d46200b123f0.zip"
    sha256 "405e053634466109a19d8dece1abfc489d4fada3fc7ffd2d62b947a543e077c0"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/fb7c1cced20d62362ab823e43f04d46200b123f0/typedb-all-mac-x86_64-fb7c1cced20d62362ab823e43f04d46200b123f0.zip"
    sha256 "127fcc778a26a6fc094c8ec82471627b7eb9c06d606241e14e6c00dac62295ae"
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
