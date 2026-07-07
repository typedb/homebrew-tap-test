# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/989f89a449b177c2849a96141b4d23790c5f3adc/typedb-all-mac-arm64-989f89a449b177c2849a96141b4d23790c5f3adc.zip"
    sha256 "1ecda515f95700ca0a32821f77744b185a12837b91fce17b6cf92fd5e56b6ab3"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/989f89a449b177c2849a96141b4d23790c5f3adc/typedb-all-mac-x86_64-989f89a449b177c2849a96141b4d23790c5f3adc.zip"
    sha256 "848eafe753ed178a56db2ac049f004572c5da119ac9daf3b2ee25a12971aeb38"
  end

  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec / "typedb"
  end
end
