# Homebrew Formula for PipelineForge
# Automatically updated by GitHub Actions release workflow
class Pforge < Formula
  desc "AI-powered pipeline generator - create CI/CD workflows in seconds"
  homepage "https://pipelineforge.dev"
  version "1.1.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-arm64.tar.gz"
      sha256 "de05473d2861000db8e8c46907ef26507529702797755cfa6839160a6cd9d016"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-amd64.tar.gz"
      sha256 "53358edcb33f2c29035c15d89d24d294f3fec85b1ba717ed85789a29792ede8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-arm64.tar.gz"
      sha256 "2d93600224164f63e19025e8d60c99c3c4148d222df24c7b766cbaffe533d187"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-amd64.tar.gz"
      sha256 "65db23ca669edbc63794c566d6141c2e9d5cc03b6d6b9df7a120987f023c5c46"
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
