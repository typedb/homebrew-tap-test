# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/3d3bdfe405d0535c46e0e040d31ae679b632497e/typedb-all-mac-arm64-3d3bdfe405d0535c46e0e040d31ae679b632497e.zip"
    sha256 "e5715c281e81d4b99e1e2b7072580344def06455559652fb8e9c031d5bf93879"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/3d3bdfe405d0535c46e0e040d31ae679b632497e/typedb-all-mac-x86_64-3d3bdfe405d0535c46e0e040d31ae679b632497e.zip"
    sha256 "162e54bba3339ca40cd71caf8aa80324c5fa8100c9e1338edd4775cc78093587"
  end

  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec / "typedb"
    (var/"typedb/data").mkpath
    (var/"typedb/logs").mkpath
    (libexec/"server/data").make_relative_symlink(var/"typedb/data")
    (libexec/"server/logs").make_relative_symlink(var/"typedb/logs")
  end

end
