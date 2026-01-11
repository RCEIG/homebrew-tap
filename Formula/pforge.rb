# Homebrew Formula for PipelineForge
# Automatically updated by GitHub Actions release workflow
class Pforge < Formula
  desc "AI-powered pipeline generator - create CI/CD workflows in seconds"
  homepage "https://pipelineforge.dev"
  version "0.5.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.pipelineforge.dev/#{version}/pforge-darwin-arm64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    else
      url "https://releases.pipelineforge.dev/#{version}/pforge-darwin-amd64"
      sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.pipelineforge.dev/#{version}/pforge-linux-arm64"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    else
      url "https://releases.pipelineforge.dev/#{version}/pforge-linux-amd64"
      sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
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

      Documentation: https://pipelineforge.dev/docs
    EOS
  end
end
