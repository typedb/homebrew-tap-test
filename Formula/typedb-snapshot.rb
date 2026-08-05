# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "378983ccf6cba88475f64815d56817b3cc15b32d"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/378983ccf6cba88475f64815d56817b3cc15b32d/typedb-all-mac-arm64-378983ccf6cba88475f64815d56817b3cc15b32d.zip"
    sha256 "80c5bd5495e37df06382a1a3c9eb11d6c36db6e1763fd959e8e0972df8e489d6"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/378983ccf6cba88475f64815d56817b3cc15b32d/typedb-all-mac-x86_64-378983ccf6cba88475f64815d56817b3cc15b32d.zip"
    sha256 "55317ec1fdf7e65998c7f5dfa08c0d68332adf9f8537829a38cc2a8ef45f8e24"
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
