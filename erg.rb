require "formula"

class Erg < Formula
  homepage "https://github.com/square/erg"
  url "https://github.com/square/erg/archive/v1.1.1.tar.gz"
  head "https://github.com/square/erg.git"
  sha1 "95b3935557a47703998f6aede1e549459f69275d"

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    # https://github.com/fvbommel/util/issues/1 fix for -insecure
    system 'go', 'get', '-insecure', 'github.com/square/erg'
    system 'go', 'get', 'github.com/droundy/goopt'
    system 'go', 'build', 'main/erg.go'
    bin.install 'erg'
  end

  bottle do
    root_url 'https://raw.githubusercontent.com/square/homebrew-bottles/master'
    cellar :any
    sha1 "5d8da89bddeb5b0a8b280469c406973ad31c895e" => :mavericks
    sha256 "59dab808928a2a5d22f09b3c85563b474efdeabfc8445430323eb720dc4ebdc9" => :yosemite
  end
end
