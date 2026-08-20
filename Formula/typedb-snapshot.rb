# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "749bc6eea14e3bf3f38e4ce1deaa38c0b208ebbd"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/749bc6eea14e3bf3f38e4ce1deaa38c0b208ebbd/typedb-all-mac-arm64-749bc6eea14e3bf3f38e4ce1deaa38c0b208ebbd.zip"
    sha256 "f395c7473d481459476693b07f4464fb3d220a180c9f50d8c78bb371b4e326f9"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/749bc6eea14e3bf3f38e4ce1deaa38c0b208ebbd/typedb-all-mac-x86_64-749bc6eea14e3bf3f38e4ce1deaa38c0b208ebbd.zip"
    sha256 "a6617209b679e603756708964b6216341af75b6e070239fd3da36cfe0d397755"
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
