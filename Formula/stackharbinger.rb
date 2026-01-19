class Stackharbinger < Formula
  desc "Track End-of-Life dates for your tech stack"
  homepage "https://stackharbinger.com"
  url "https://rubygems.org/downloads/stackharbinger-0.2.0.gem"
  sha256 "7843b98081821563a8db05ca133d3d5bd00ba7886c44024da044d993bdaf0454"
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
    assert_match "Harbinger version 0.2.0", shell_output("#{bin}/harbinger version")
  end
end
