# Homebrew Formula for KubeFix
# Automatically updated by GitHub Actions release workflow
class Kubefix < Formula
  desc "AI-powered Kubernetes troubleshooting - diagnose and fix cluster issues instantly"
  homepage "https://kubefix.dev"
  version "0.1.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-arm64.tar.gz"
      sha256 "e78e75371a0f130bdf11513806686878a454e6ba1848230701d9716ede8d15b5"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-amd64.tar.gz"
      sha256 "3c3e5dce301210aaadc25f5dd7eca42790b73be5089ea51e4100cf66e74dbd2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-arm64.tar.gz"
      sha256 "3c68fa70e2a7edcbf61e0f0aea3742630ef491cbf4b29cbf4b4137612460a0da"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-amd64.tar.gz"
      sha256 "0171c56cca47f62198d498172bbc4c3b2d7864664d6f5cfd6ca40e8a896f959e"
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
