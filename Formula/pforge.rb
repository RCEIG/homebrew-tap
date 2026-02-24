# Homebrew Formula for PipelineForge
# Automatically updated by GitHub Actions release workflow
class Pforge < Formula
  desc "AI-powered pipeline generator - create CI/CD workflows in seconds"
  homepage "https://pipelineforge.dev"
  version "1.2.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-arm64.tar.gz"
      sha256 "5754d604dca5e00cbe3a39c6a72e2245076e76b929631e8d1f8d8df8beaf2982"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-amd64.tar.gz"
      sha256 "683222a38751234de1593dca9466a31434f2895a04b52c958c83cc7712e53a4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-arm64.tar.gz"
      sha256 "1430af5a697629a49c35e0a65e31ad7f6c2cda69426d49352f3709be6a9fe29c"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-amd64.tar.gz"
      sha256 "5760dbf5a9e1fc3a77158e318f06e55e33ebe696615c7c0c5ec5af93ae95ecdc"
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
