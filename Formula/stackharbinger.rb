class Stackharbinger < Formula
  desc "Track End-of-Life dates for your tech stack"
  homepage "https://stackharbinger.com"
  url "https://rubygems.org/downloads/stackharbinger-0.3.0.gem"
  sha256 "f8d3a1601bdceba5048fec73acb7cda5ca338c12d5675e1ba26c43faf8775ba9"
  license "MIT"

  depends_on "ruby" => "3.1"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", cached_download, "--no-document",
           "--install-dir", libexec
    bin.install libexec/"bin/harbinger"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match "Harbinger version 0.3.0", shell_output("#{bin}/harbinger version")
  end
end
