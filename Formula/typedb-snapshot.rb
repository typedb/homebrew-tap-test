# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "73542737c571d7f35b8d747342cdf80d67e2ef3c"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/73542737c571d7f35b8d747342cdf80d67e2ef3c/typedb-all-mac-arm64-73542737c571d7f35b8d747342cdf80d67e2ef3c.zip"
    sha256 "af887fac3256575a26325292aff3b7121170aa40f07350c98eeaf82d86a913ae"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/73542737c571d7f35b8d747342cdf80d67e2ef3c/typedb-all-mac-x86_64-73542737c571d7f35b8d747342cdf80d67e2ef3c.zip"
    sha256 "9ed64c3e07ad11773261e84d3fb737b07e3e88bb07e22c87dd454bf5a77dd5f7"
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
