# Homebrew Formula for PipelineGuard
# Automatically updated by GitHub Actions release workflow
class Pguard < Formula
  desc "Offline-first CI/CD security scanner - catch vulnerabilities before they reach production"
  homepage "https://getpguard.com"
  version "2.13.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-arm64.tar.gz"
      sha256 "14b33661a853a88a807f3291ca27a8e60726cf1069c51b9f132e0aa3a824e533"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-amd64.tar.gz"
      sha256 "6a808b6ce3140d9f9006b920b8d0abd346a9b756fd423c986d5f556c79e8aee5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-arm64.tar.gz"
      sha256 "d387a195c19fe09fbe7313c7689e59b9b08b743d8aca455475868d49fbf9e57c"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-amd64.tar.gz"
      sha256 "62d82d6474eeefb0b2e3c46064695c0a48273e653d345e8eafe1d684dd4c996a"
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
