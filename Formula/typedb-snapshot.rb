# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "f48fc4ca34ab4aba3d8d7b70492336afd1687f08"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/f48fc4ca34ab4aba3d8d7b70492336afd1687f08/typedb-all-mac-arm64-f48fc4ca34ab4aba3d8d7b70492336afd1687f08.zip"
    sha256 "82e3e3fd1f0799a4ea353c5aa72cf2d6ca098a11995a017ea8d3cf7a485af5ea"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/f48fc4ca34ab4aba3d8d7b70492336afd1687f08/typedb-all-mac-x86_64-f48fc4ca34ab4aba3d8d7b70492336afd1687f08.zip"
    sha256 "3e81e6c223759d357cf73a7b5598753501decb854e40b1a67b794328e486882f"
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
