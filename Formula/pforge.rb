# Homebrew Formula for PipelineForge
# Automatically updated by GitHub Actions release workflow
class Pforge < Formula
  desc "AI-powered pipeline generator - create CI/CD workflows in seconds"
  homepage "https://pipelineforge.dev"
  version "1.2.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-arm64.tar.gz"
      sha256 "7927f98f0a4927b49057be599cbbc3952c7d0a6fd267f875139dbc932bd6da31"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-darwin-amd64.tar.gz"
      sha256 "b986ae893929482361a71c7506934845347c174cfc318ad678c7f1df13928271"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-arm64.tar.gz"
      sha256 "336d2ec4f434be8c1459d91dafd8b9675cd6155ab2b8c918e41c6470fb48a811"
    else
      url "https://github.com/RCEIG/PipelineForge-Product/releases/download/v#{version}/pforge-linux-amd64.tar.gz"
      sha256 "258cba77ddee77fdb57a243e28a0a6b36f77a1a37c0abc8ea1e1f24229f753a0"
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
