# Homebrew Formula for PipelineForge
# Automatically updated by GitHub Actions release workflow
class Pforge < Formula
  desc "AI-powered pipeline generator - create CI/CD workflows in seconds"
  homepage "https://pipelineforge.dev"
  version "1.3.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://releases.pipelineforge.dev/#{version}/pforge-darwin-arm64.tar.gz"
      sha256 "63e3682c17439c178bfd4bbdbd42df58020163c8ac9e2f5f6fb9a02ae891e4e2"
    else
      url "https://releases.pipelineforge.dev/#{version}/pforge-darwin-amd64.tar.gz"
      sha256 "2b7f48170583fa1f4c082f1131e21e7d063617c8447062558b3dd121d851f49a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.pipelineforge.dev/#{version}/pforge-linux-arm64.tar.gz"
      sha256 "9bee1145e0a34e50ef96e1cf608129a72315cb1337777a155cdfb54612b50dc6"
    else
      url "https://releases.pipelineforge.dev/#{version}/pforge-linux-amd64.tar.gz"
      sha256 "8c07c252e47b34bbb882a4f53d5bcd9b27f37f0f12366f152fc68bea0af99a7f"
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
