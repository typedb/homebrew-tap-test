# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "499dedd67eb4ee55bec45d217fb2bcf5942961ff"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/499dedd67eb4ee55bec45d217fb2bcf5942961ff/typedb-all-mac-arm64-499dedd67eb4ee55bec45d217fb2bcf5942961ff.zip"
    sha256 "42e8f589b1ad6a067224e75d49fbbbbc167109faf81a4a0ca9a219dd2acd8af8"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/499dedd67eb4ee55bec45d217fb2bcf5942961ff/typedb-all-mac-x86_64-499dedd67eb4ee55bec45d217fb2bcf5942961ff.zip"
    sha256 "d6568199a6bc3ce0465e8f1d8417595269fb451fc18d54904edecb6471546e4d"
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
