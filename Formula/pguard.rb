# Homebrew Formula for PipelineGuard
# Automatically updated by GitHub Actions release workflow
class Pguard < Formula
  desc "Offline-first CI/CD security scanner - catch vulnerabilities before they reach production"
  homepage "https://getpguard.com"
  version "2.11.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-arm64.tar.gz"
      sha256 "d359a188635c8cdbb6db511f9690b3005787788dad0b23b496140f321b6ef725"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-amd64.tar.gz"
      sha256 "d44785c338f06747460b25c18f1b54098b18a0a0102bf247967ebf7f324b6399"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-arm64.tar.gz"
      sha256 "357a9e48e5d040c4abc5f8edb8d036bc8d640808395e399479b9bfb7ee8ca9fe"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-amd64.tar.gz"
      sha256 "61ccee483086f04a6862027b17095cad4a5b6ca213b96386795e7454de9f5493"
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
