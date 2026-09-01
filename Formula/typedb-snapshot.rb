# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "74ecbd5d8203dcfdb93f7c6d2f503c6596ab04b6"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/74ecbd5d8203dcfdb93f7c6d2f503c6596ab04b6/typedb-all-mac-arm64-74ecbd5d8203dcfdb93f7c6d2f503c6596ab04b6.zip"
    sha256 "a39977d7d356b729a7dbb82014f7381bdc9b2edc060b312ddf49b41bfa23137e"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/74ecbd5d8203dcfdb93f7c6d2f503c6596ab04b6/typedb-all-mac-x86_64-74ecbd5d8203dcfdb93f7c6d2f503c6596ab04b6.zip"
    sha256 "d7071ac19df011fbcfe0f948ad69392cb1f9d07ac95cc056a93101802da95a2a"
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
