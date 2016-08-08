require "formula"

class Gssh < Formula
  homepage "https://github.com/square/gssh"
  url "https://github.com/square/gssh/archive/v1.0.1.tar.gz"
  head "https://github.com/square/gssh.git"
  sha256 "db2d9b087638838f836c8ad9cf63014bbfeefc85"

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', '-d'
    system 'go', 'build', 'gssh.go'
    bin.install 'gssh'
  end

  bottle do
    root_url 'https://raw.githubusercontent.com/square/homebrew-bottles/master'
    cellar :any
    sha256 "b329fe9b2f8248b2854b3eb0ebed16a52e24292c" => :mavericks
  end
end
