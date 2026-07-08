# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/56c4775387e3d671c11539e2db85d70c60f8d9a9/typedb-all-mac-arm64-56c4775387e3d671c11539e2db85d70c60f8d9a9.zip"
    sha256 "b4f0090c17883f30b88e0037fd71f5a0866db4b3b34814b227ec10424d32a8e4"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/56c4775387e3d671c11539e2db85d70c60f8d9a9/typedb-all-mac-x86_64-56c4775387e3d671c11539e2db85d70c60f8d9a9.zip"
    sha256 "d55bae7ea1039f8697cbcf9f51db1b24257fd959e4ba4ed03f2615f420b1ec5e"
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
