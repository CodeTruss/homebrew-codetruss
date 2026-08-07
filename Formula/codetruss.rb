class Codetruss < Formula
  desc "Deterministic first-pass verification gate for AI-written code"
  homepage "https://codetruss.com/cli"
  url "https://github.com/CodeTruss/codetruss-cli/releases/download/v0.2.45/codetruss-cli-0.2.45.tgz"
  sha256 "0ced9ca92b28a96faf997a1c45911fd2dd77bb4107fdd3153d88692139c714ce"
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
