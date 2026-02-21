# Homebrew Formula for PipelineForge
# Automatically updated by GitHub Actions release workflow
class Pforge < Formula
  desc "AI-powered pipeline generator - create CI/CD workflows in seconds"
  homepage "https://pipelineforge.dev"
  version "1.1.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-arm64.tar.gz"
      sha256 "64e93a38e64af02a9cb601c7b83d62b34d4ac459b3ec6054a7b2c3d5a7e4ee7a"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-amd64.tar.gz"
      sha256 "bd59587fdffed96544bbec8ad58aee8d4f9052c4ffc1034fc5d4c93225530de8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-arm64.tar.gz"
      sha256 "f9791f18f07c90b6afa7f0cff937b2c46914c4f8c81425c5bba71266d0fa9305"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-amd64.tar.gz"
      sha256 "79151edd07ab5bfbb95dc51afa38aae8acb25693ae95edf771ccec46b76120fc"
    end
  end

  def install
    bin.install Dir["pforge*"].first => "pforge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pforge --version")
  end

  def caveats
    <<~EOS
      ⚡ PipelineForge installed successfully!

      Quick start:
        pforge generate

      AI model management (ONNX-enabled builds):
        pforge model install    Download AI models for offline use
        pforge model import     Import models from air-gapped bundle
        pforge model verify     Check model integrity

      Documentation: https://pipelineforge.dev/docs
    EOS
  end
end
