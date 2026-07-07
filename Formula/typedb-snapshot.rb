# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/3bb6c909731ef123bfd467659e6a7fb5573a7bb5/typedb-all-mac-arm64-3bb6c909731ef123bfd467659e6a7fb5573a7bb5.zip"
    sha256 "f6820e9db012046b329b7ba766d2c4bcf9950e45cd6d8cba015e6888a061d602"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/3bb6c909731ef123bfd467659e6a7fb5573a7bb5/typedb-all-mac-x86_64-3bb6c909731ef123bfd467659e6a7fb5573a7bb5.zip"
    sha256 "3784bd4d1aeb33ed5c80ad4c2a9cb19ff74d3f838109b5d94a0cf78b569c2d16"
  end

  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec / "typedb"
  end
end
