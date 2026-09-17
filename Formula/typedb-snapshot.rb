# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "f5e1d028dc9f560f5a87050e58dc5d26811cd39d"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/f5e1d028dc9f560f5a87050e58dc5d26811cd39d/typedb-all-mac-arm64-f5e1d028dc9f560f5a87050e58dc5d26811cd39d.zip"
    sha256 "8c043830e7c5cd67dbff5ae444cedbcb8185d76fe2dc17d3a8f7fdf4c4ef3394"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/f5e1d028dc9f560f5a87050e58dc5d26811cd39d/typedb-all-mac-x86_64-f5e1d028dc9f560f5a87050e58dc5d26811cd39d.zip"
    sha256 "10039a48b2aa48cae062da49402c9490ed5f9578f494a267d3362e4390410270"
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
