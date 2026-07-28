# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "5eee51d74069445883cd7c32ab8bc4cbc63ad801"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5eee51d74069445883cd7c32ab8bc4cbc63ad801/typedb-all-mac-arm64-5eee51d74069445883cd7c32ab8bc4cbc63ad801.zip"
    sha256 "591d9bccc91688fb1bb453128b3e4694167a3668fc040f6d63358f5702b90007"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5eee51d74069445883cd7c32ab8bc4cbc63ad801/typedb-all-mac-x86_64-5eee51d74069445883cd7c32ab8bc4cbc63ad801.zip"
    sha256 "9b6662dbe84563fe8c97a86b0bcf9938d31a95d165d260fe6d2802d5384350e2"
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
