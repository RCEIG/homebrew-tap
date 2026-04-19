# Homebrew Formula for KubeFix
# Automatically updated by GitHub Actions release workflow
class Kubefix < Formula
  desc "AI-powered Kubernetes troubleshooting - diagnose and fix cluster issues instantly"
  homepage "https://kubefix.dev"
  version "0.3.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.kubefix.dev/#{version}/kubefix-darwin-arm64.tar.gz"
      sha256 "298456feb6f9b9e358d4c96546a404800736f682ddba7b8f4e6ce820ef019e74"
    else
      url "https://releases.kubefix.dev/#{version}/kubefix-darwin-amd64.tar.gz"
      sha256 "bd828b73e595da532b972263992665e64dbed5f645b6a91d98d2082d2eea9008"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.kubefix.dev/#{version}/kubefix-linux-arm64.tar.gz"
      sha256 "5f898c2b38bcc527f7d3051018223f21e87d40aca512e4d4c1ff7b9de0d14f49"
    else
      url "https://releases.kubefix.dev/#{version}/kubefix-linux-amd64.tar.gz"
      sha256 "e13ec724296c8dcdff504178a85b133a74693e8037356ea9a28783dd6ead4d60"
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
