class Codetruss < Formula
  desc "Deterministic first-pass verification gate for AI-written code"
  homepage "https://codetruss.com/cli"
  url "https://github.com/DeliriumPulse/codetruss-cli/releases/download/v0.2.30/codetruss-cli-0.2.30.tgz"
  sha256 "9c97f573aa7e7a052fe8d4c578efda6a8d43f2bcfec9a74ab7d2fdf6b53eccdc"
  license :cannot_represent

  depends_on "node"

  def install
    libexec.install "CHANGELOG.md", "LICENSE", "README.md", "SBOM.cdx.json",
                    "SECURITY.md", "THIRD_PARTY_NOTICES.md", "dist", "package.json"
    bin.install_symlink libexec/"dist/cli.cjs" => "codetruss"
  end

  test do
    assert_match "codetruss #{version}", shell_output("#{bin}/codetruss --version")

    system "git", "init", "--quiet"
    system bin/"codetruss", "init", "--allow", "src/**"
    assert_path_exists testpath/".codetruss.yml"
    assert_match "- src/**", (testpath/".codetruss.yml").read
  end
end
