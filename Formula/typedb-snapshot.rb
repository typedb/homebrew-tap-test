# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# IMPORTANT: any changes to the formula should be propagated to Homebrew/homebrew-core
class TypedbSnapshot < Formula
  desc "The power of programming, in your database"
  homepage "https://typedb.com"
  version "3df61c2dddec0b40ddd6f26b6e785dd6392bac63"

  on_arm do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-arm64/versions/3df61c2dddec0b40ddd6f26b6e785dd6392bac63/typedb-all-mac-arm64-3df61c2dddec0b40ddd6f26b6e785dd6392bac63.zip"
    sha256 "ab319b743264fe3b4b5114382c85cd8bb79bc3c76b3a1a600f2d192516fad766"
  end

  on_intel do
    url "https://repo.typedb.com/public/public-snapshot/raw/names/typedb-all-mac-x86_64/versions/3df61c2dddec0b40ddd6f26b6e785dd6392bac63/typedb-all-mac-x86_64-3df61c2dddec0b40ddd6f26b6e785dd6392bac63.zip"
    sha256 "d3273ee9cd08a6f0f7852d7a33a865fa52380a31aa991919ac03e98195667ec3"
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
