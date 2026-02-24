# Homebrew Formula for KubeFix
# Automatically updated by GitHub Actions release workflow
class Kubefix < Formula
  desc "AI-powered Kubernetes troubleshooting - diagnose and fix cluster issues instantly"
  homepage "https://kubefix.dev"
  version "0.2.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-arm64.tar.gz"
      sha256 "524610361f74922a356c47705a9423bb3f7a3cee5c87a39e53c2ccfb629dcfa1"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-darwin-amd64.tar.gz"
      sha256 "df3972330a1f36cafaa68196146479b7406cefd3b655be45e3b740b5f06a174f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-arm64.tar.gz"
      sha256 "0f272a9ced33aef72f64a192945fafb616af5abf9de25a533e1fad5cd8b042fd"
    else
      url "https://github.com/RCEIG/kubefix-product/releases/download/v#{version}/kubefix-linux-amd64.tar.gz"
      sha256 "fe3247dedc93a7cf0a09ca45b3b8fb1604dc6e8344191ee5943a0eb0c2cc4308"
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
