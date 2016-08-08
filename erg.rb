require "formula"

class Erg < Formula
  homepage "https://github.com/square/erg"
  url "https://github.com/square/erg/archive/v1.1.1.tar.gz"
  head "https://github.com/square/erg.git"
  sha256 "8dbcff3dfd67b8f6e8f2dfd4f57cf818ce0cd6ce4b52566611e698fc8778507f"

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
    sha256 "0d6000fdd2f0fc6ca025ce4b980b85d0bd13135736cebe7ad1aba8f5c3f937e9" => :mavericks
    sha256 "59dab808928a2a5d22f09b3c85563b474efdeabfc8445430323eb720dc4ebdc9" => :yosemite
    sha256 "fc3f255620471bdeb8cd7e73ec7aafd89f27be0e491931bc1a0b9fde2c660e81" => :el_capitan
  end
end
