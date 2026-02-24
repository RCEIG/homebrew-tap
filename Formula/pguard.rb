# Homebrew Formula for PipelineGuard
# Automatically updated by GitHub Actions release workflow
class Pguard < Formula
  desc "Offline-first CI/CD security scanner - catch vulnerabilities before they reach production"
  homepage "https://getpguard.com"
  version "2.12.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-arm64.tar.gz"
      sha256 "757510eeb5e4bea2322605be570820067c56b6d7957cb36d1ff7c719d9d2883d"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-amd64.tar.gz"
      sha256 "413f8ba0ad4c3e07d8d88c2528275b51cc98c0f6ee1ffedb3a529238285836ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-arm64.tar.gz"
      sha256 "502718b384ad627c73fb6454736c52cba066b6247c9d84e50f0f38c34ea35698"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-amd64.tar.gz"
      sha256 "e40f7762eb4ad0c063bd5620f7c0b7d630aa3e62eae24aff47b4f68b6694a59c"
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
      PipelineGuard installed successfully!

      Quick start:
        pguard scan .

      Documentation: https://getpguard.com/docs
    EOS
  end
end
