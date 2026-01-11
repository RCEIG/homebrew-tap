# Homebrew Formula for KubeFix
# Automatically updated by GitHub Actions release workflow
class Kubefix < Formula
  desc "AI-powered Kubernetes troubleshooting - diagnose and fix cluster issues instantly"
  homepage "https://kubefix.dev"
  version "1.5.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.kubefix.dev/#{version}/kubefix-darwin-arm64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    else
      url "https://releases.kubefix.dev/#{version}/kubefix-darwin-amd64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.kubefix.dev/#{version}/kubefix-linux-arm64"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    else
      url "https://releases.kubefix.dev/#{version}/kubefix-linux-amd64"
      sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
    end
  end

  def install
    bin.install Dir["kubefix*"].first => "kubefix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubefix --version")
  end

  def caveats
    <<~EOS
      🔧 KubeFix installed successfully!

      Quick start:
        kubefix diagnose

      Documentation: https://kubefix.dev/docs
    EOS
  end
end
