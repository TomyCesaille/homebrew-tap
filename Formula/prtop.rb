class Prtop < Formula
  include Language::Python::Virtualenv

  desc "Live terminal table of your merge requests, from review to production"
  homepage "https://github.com/TomyCesaille/prtop"
  url "https://github.com/TomyCesaille/prtop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6e2d74907f3534ca9de8f7ede2d3e1341d0fddc410982731a45b2c70cca27f97"
  license "MIT"

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
