require "formula"

class Erg < Formula
  homepage "https://github.com/square/erg"
  url "https://github.com/square/erg/archive/v1.2.1.tar.gz"
  head "https://github.com/square/erg.git"
  sha256 "2552a849a785e4f3c2252c4862d938794e791eea84d23ec7dfc89fce621244e6"

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/square/erg'
    system 'go', 'get', 'github.com/droundy/goopt'
    system 'go', 'build', 'main/erg.go'
    bin.install 'erg'
  end
end
