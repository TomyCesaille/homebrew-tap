class Prtop < Formula
  include Language::Python::Virtualenv

  desc "Live terminal table of your merge and pull requests, from review to production"
  homepage "https://github.com/TomyCesaille/prtop"
  url "https://github.com/TomyCesaille/prtop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6e2d74907f3534ca9de8f7ede2d3e1341d0fddc410982731a45b2c70cca27f97"
  license "MIT"

  bottle do
    root_url "https://github.com/TomyCesaille/homebrew-tap/releases/download/prtop-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5136c76b501993fe5d68057856fc1e4f1dd54f0c3d81e54af9f682d32dcfb3e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "037239f6f6eeb0ec870e7967062421ee2bd1e470653c5891730b86dd58d647f9"
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
