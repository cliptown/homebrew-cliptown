class Cliptown < Formula
  desc "Secure, cross-platform clipboard manager"
  homepage "https://cliptown.github.io"
  version "0.1.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/cliptown/cliptown-cli/releases/download/v0.1.0/cliptown-cli-macos-arm64.tar.gz"
    # sha256 "REPLACE_WITH_SHA256_WHEN_PUBLISHED"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/cliptown/cliptown-cli/releases/download/v0.1.0/cliptown-cli-macos-x86_64.tar.gz"
    # sha256 "REPLACE_WITH_SHA256_WHEN_PUBLISHED"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cliptown/cliptown-cli/releases/download/v0.1.0/cliptown-cli-linux-x86_64.tar.gz"
    # sha256 "REPLACE_WITH_SHA256_WHEN_PUBLISHED"
  end

  def install
    bin.install "cliptown"
  end

  test do
    system "#{bin}/cliptown", "--help"
  end
end
