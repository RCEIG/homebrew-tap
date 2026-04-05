# Homebrew Formula for PipelineGuard
# Automatically updated by GitHub Actions release workflow
class Pguard < Formula
  desc "Offline-first CI/CD security scanner - catch vulnerabilities before they reach production"
  homepage "https://getpguard.com"
  version "2.12.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-darwin-arm64.tar.gz"
      sha256 "726dd73fd2574a689cb193b75366d501eb259d6bc609cbedd1836203db405bb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-arm64.tar.gz"
      sha256 "9649cf073f4c01eaf2e71cb1f0f5ff3460d2ea30dd6c0e027b463829c25954c6"
    else
      url "https://github.com/RCEIG/PipelineGuard-Product/releases/download/v#{version}/pguard-linux-amd64.tar.gz"
      sha256 "4c507ea71e16d0e5e1fe49fdfab66391f37b60318e058e3f31d8512e3e261563"
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
