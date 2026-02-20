# Homebrew Formula for KubeFix
# Automatically updated by GitHub Actions release workflow
class Kubefix < Formula
  desc "AI-powered Kubernetes troubleshooting - diagnose and fix cluster issues instantly"
  homepage "https://kubefix.dev"
  version "0.1.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-arm64.tar.gz"
      sha256 "bc9a990d8f95d95ba6daca927d9823c22762a7e278852df041b13fafb07c6db2"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-amd64.tar.gz"
      sha256 "45944f7410954502b58193408dc2085c9a207d350b1994b2fbfcae2d3e4480b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-arm64.tar.gz"
      sha256 "70ba740589f10df374232f78e454d350d8f7cecc9ea5365455ec3c64efa16784"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-amd64.tar.gz"
      sha256 "d74d57e8c744f03f8bf1faf6aec7ccdc340e162d96271d8855f571ed849bcc2f"
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

      AI model management (ONNX-enabled builds):
        kubefix model install    Download AI models for offline use
        kubefix model import     Import models from air-gapped bundle
        kubefix model verify     Check model integrity

      Documentation: https://kubefix.dev/docs
    EOS
  end
end
