# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "d20b87875426a40cc48424c050eb945dafc2bc9b"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/d20b87875426a40cc48424c050eb945dafc2bc9b/typedb-all-mac-arm64-d20b87875426a40cc48424c050eb945dafc2bc9b.zip"
    sha256 "94ab5a395a065dbd8b4c1435a039e0a53bec94f4a16898676a69086561b4908d"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/d20b87875426a40cc48424c050eb945dafc2bc9b/typedb-all-mac-x86_64-d20b87875426a40cc48424c050eb945dafc2bc9b.zip"
    sha256 "90313076d8b0a3319d843c6f10aa1b9c30e1b4f0db5a065aa41ef52570d31830"
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
