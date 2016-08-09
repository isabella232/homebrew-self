require "formula"

class Gssh < Formula
  homepage "https://github.com/square/gssh"
  url "https://github.com/square/gssh/archive/v1.0.1.tar.gz"
  head "https://github.com/square/gssh.git"
  sha256 "e055eaf7765a4e62e8785c982f5581066f08937e90d826af691b5c094b900ff0"

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
  end
end
