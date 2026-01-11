# Homebrew Formula for PipelineGuard
# Automatically updated by GitHub Actions release workflow
class Pguard < Formula
  desc "Offline-first CI/CD security scanner - catch vulnerabilities before they reach production"
  homepage "https://getpguard.com"
  version "2.11.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.getpguard.com/#{version}/pguard-darwin-arm64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    else
      url "https://releases.getpguard.com/#{version}/pguard-darwin-amd64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.getpguard.com/#{version}/pguard-linux-arm64"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    else
      url "https://releases.getpguard.com/#{version}/pguard-linux-amd64"
      sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
    end
  end

  def install
    bin.install Dir["pguard*"].first => "pguard"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pguard --version")
  end

  def caveats
    <<~EOS
      🛡️ PipelineGuard installed successfully!

      Quick start:
        pguard scan .

      Documentation: https://getpguard.com/docs
    EOS
  end
end
