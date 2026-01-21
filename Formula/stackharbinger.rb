class Stackharbinger < Formula
  desc "Track End-of-Life dates for your tech stack"
  homepage "https://stackharbinger.com"
  url "https://rubygems.org/downloads/stackharbinger-1.0.1.gem"
  sha256 "eca13857bd5b60f4dbca6485eed11e70be6c7267ce2a4c0db9634b0b79912ffe"
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
    assert_match "Harbinger version 1.0.1", shell_output("#{bin}/harbinger version")
  end
end
