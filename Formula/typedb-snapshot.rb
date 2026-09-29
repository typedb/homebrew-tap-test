# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "5c90131cb498d6df900dd5a94397b6cf99966eb2"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/5c90131cb498d6df900dd5a94397b6cf99966eb2/typedb-all-mac-arm64-5c90131cb498d6df900dd5a94397b6cf99966eb2.zip"
    sha256 "722185f417f2e1e6d77bcaa0e19073c75517d7909fdd12e7bd5b37f8b3188c22"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/5c90131cb498d6df900dd5a94397b6cf99966eb2/typedb-all-mac-x86_64-5c90131cb498d6df900dd5a94397b6cf99966eb2.zip"
    sha256 "f42c71e04b86b73d2e29387432e89382b23fe9f50598f161c4b37c8aca17103b"
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
