# Homebrew Formula for KubeFix
# Automatically updated by GitHub Actions release workflow
class Kubefix < Formula
  desc "AI-powered Kubernetes troubleshooting - diagnose and fix cluster issues instantly"
  homepage "https://kubefix.dev"
  version "0.2.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-arm64.tar.gz"
      sha256 "8812ec716cf2cd0f489c9eceb6581212c9745fd9501ea7ac5e301d0bb145a8cb"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-amd64.tar.gz"
      sha256 "47c9c45750c4e393619794bce87dcd5ea617fa85d7f05dab3515ec10c0d9a4e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-arm64.tar.gz"
      sha256 "9c7c5c0793e263736acd818c354a2538632c869f932cd94be717a38f928944a9"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-amd64.tar.gz"
      sha256 "c0fd60f309370da8bb004b6945ab39511c1874f7ac531d2516da566303b39e49"
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
      KubeFix installed successfully!

      Quick start:
        kubefix diagnose

      Documentation: https://kubefix.dev/docs
    EOS
  end
end
