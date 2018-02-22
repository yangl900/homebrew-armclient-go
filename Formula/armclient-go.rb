class ArmclientGo < Formula
  desc "Command-line tool for calling Azure Resource Manager (ARM) API"
  homepage "https://github.com/yangl900/armclient-go"
  url "https://github.com/yangl900/armclient-go/archive/v0.2.3.tar.gz"
  sha256 "76ed3466d7fb20b2acf43681c648353a01e80fb7f29c4ad0189eeb8aba246e05"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOOS"] = "darwin"
    ENV["GOARCH"] = "amd64"

    (buildpath/"src/github.com/yangl900/armclient-go").install buildpath.children
    cd "src/github.com/yangl900/armclient-go" do
      system "go", "build", "-o", "armclient", "."
      bin.install "armclient"
    end
  end

  test do
    system "#{bin}/armclient", "--version"
  end
end
