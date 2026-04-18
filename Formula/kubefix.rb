# Homebrew Formula for KubeFix
# Automatically updated by GitHub Actions release workflow
class Kubefix < Formula
  desc "AI-powered Kubernetes troubleshooting - diagnose and fix cluster issues instantly"
  homepage "https://kubefix.dev"
  version "0.3.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-arm64.tar.gz"
      sha256 "b38063b9ddcdb788ac47e92c672c4979d478046e4855ad085738941e5d3067aa"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-amd64.tar.gz"
      sha256 "684bf922dce1095729ff0f0f24b113874077418c6513a8c9dcf0a9a71c1ca7a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-arm64.tar.gz"
      sha256 "706a08f6eb1a446a15fe5943d35e9f638a52001b6a6e4da461c4d03d63fdad9a"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-amd64.tar.gz"
      sha256 "0da53b4a4b269d01d2d991918c8b08c0838aed12dcc5da847df61557458c40df"
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
