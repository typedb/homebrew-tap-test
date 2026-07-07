# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class Typedb < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/e72c207ec8709c47500129723026bd373fecf258/typedb-all-mac-arm64-e72c207ec8709c47500129723026bd373fecf258.zip"
    sha256 "f8771727a666beadf86149b6462084954994f5a1dabb7fdac869ce240cbe6aad"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/e72c207ec8709c47500129723026bd373fecf258/typedb-all-mac-x86_64-e72c207ec8709c47500129723026bd373fecf258.zip"
    sha256 "539d69be94f0c673c5e00759d84b21e269c23dbcd668f947899502856f119761"
  end

  license "MPL-2.0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec / "typedb"
  end
end
