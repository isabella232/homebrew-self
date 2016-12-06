require "formula"

class Erg < Formula
  homepage "https://github.com/square/erg"
  url "https://github.com/square/erg/archive/v1.2.1.tar.gz"
  head "https://github.com/square/erg.git"
  sha256 "2552a849a785e4f3c2252c4862d938794e791eea84d23ec7dfc89fce621244e6"

  depends_on 'go' => :build

  bottle do
    root_url 'https://raw.githubusercontent.com/square/homebrew-bottles/master'
    cellar :any_skip_relocation
    sha256 "52c6de433e7ade687b434f0ce4084cd276db87a6e20435c7b8698a0c131fde57" => :sierra
  end

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/square/erg'
    system 'go', 'get', 'github.com/droundy/goopt'
    system 'go', 'build', 'main/erg.go'
    bin.install 'erg'
  end
end
