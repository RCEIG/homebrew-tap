# Homebrew Formula for PipelineGuard
# Automatically updated by GitHub Actions release workflow
class Pguard < Formula
  desc "Offline-first CI/CD security scanner - catch vulnerabilities before they reach production"
  homepage "https://getpguard.com"
  version "2.11.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-arm64.tar.gz"
      sha256 "04e129e343e7e7c6078ea24f37121e566335a6235ef903369367e16b8daad7f9"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-amd64.tar.gz"
      sha256 "a2ccf5a0aa244c147997f5ac71961468667f4e297068b5f6c20e9ecc699f792a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-arm64.tar.gz"
      sha256 "823f6fe826eef50e1cfe956cc6102e449953253984001929e4b6694a17c2f57f"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-amd64.tar.gz"
      sha256 "4e0d3a6d7d19c14cafc5cfe3f59ae559d098d6c3248b1a3b7a399c93a5150126"
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

      AI model management (ONNX-enabled builds):
        pguard model install    Download AI models for offline use
        pguard model import     Import models from air-gapped bundle
        pguard model verify     Check model integrity

      Documentation: https://getpguard.com/docs
    EOS
  end
end
