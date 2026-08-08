class Codetruss < Formula
  desc "Deterministic first-pass verification gate for AI-written code"
  homepage "https://codetruss.com/cli"
  url "https://github.com/CodeTruss/codetruss-cli/releases/download/v0.2.50/codetruss-cli-0.2.50.tgz"
  sha256 "1f5fc0d4633cda7d82f2c07e315496a9608bc15f01aa14cfc10aebbd88c977f5"
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
