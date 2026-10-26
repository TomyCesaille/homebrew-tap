class Prtop < Formula
  include Language::Python::Virtualenv

  desc "Live terminal table of your merge and pull requests, from review to production"
  homepage "https://github.com/TomyCesaille/prtop"
  url "https://github.com/TomyCesaille/prtop/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ddd68bf547e5196c7077b742c6cfbddc6c4de3a7de6851ab6a66180beff82584"
  license "MIT"

  bottle do
    root_url "https://github.com/TomyCesaille/homebrew-tap/releases/download/prtop-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "56b6a3664e3a3c995404e0d78e8d9f529f2a3fce94d5ffe6fe963417d54b7dc9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "10e233ac5d5ced347c659129be465d7a0a8996b37eb9ed45c7d0141f3530f40a"
  end

  depends_on "gh"
  depends_on "glab"
  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "prtop #{version}", shell_output("#{bin}/prtop --version")
    assert_match "awaiting prod trigger", shell_output("#{bin}/prtop --demo")
  end
end
