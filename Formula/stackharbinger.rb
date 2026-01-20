class Stackharbinger < Formula
  desc "Track End-of-Life dates for your tech stack"
  homepage "https://stackharbinger.com"
  url "https://rubygems.org/downloads/stackharbinger-1.0.0.gem"
  sha256 "5735f5e07eebe4f519390aef7493f1eff4b1d475bb750e559b4f21632a10e74f"
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
    assert_match "Harbinger version 1.0.0", shell_output("#{bin}/harbinger version")
  end
end
