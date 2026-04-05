# Homebrew Formula for PipelineForge
# Automatically updated by GitHub Actions release workflow
class Pforge < Formula
  desc "AI-powered pipeline generator - create CI/CD workflows in seconds"
  homepage "https://pipelineforge.dev"
  version "1.2.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-arm64.tar.gz"
      sha256 "cbc9a4ce974c3f8785b912ac6cbeca9aff0bf0fe0a09513218324ea3ad16ff4a"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-amd64.tar.gz"
      sha256 "f973670cbe381f7d26b95fabbe676e4f85fd6021bc01edeaddf9298f81e926c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-arm64.tar.gz"
      sha256 "436f26633b2baa84beef96076d7fee1fd347984a8a716dbb047b002c18a53f16"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-amd64.tar.gz"
      sha256 "f95eb109af8254d3d0a868de4d131b40f8261fb2d66ae11cebd06690c11488bd"
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
      PipelineForge installed successfully!

      Quick start:
        pforge generate

      Documentation: https://pipelineforge.dev/docs
    EOS
  end
end
