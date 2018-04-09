require File.expand_path("../../language/php", __FILE__)
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)

class Envoy < Formula
  include Language::PHP::Composer

  desc "Elegant SSH tasks for PHP"
  homepage "https://github.com/laravel/envoy"
  url "https://github.com/laravel/envoy/archive/v1.3.4.tar.gz"
  sha256 "c53c043203ee9d611603affefde11f983256ea2df442cb96ac0a67edbe2e6222"
  head "https://github.com/laravel/envoy.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "4fde8733f1285d3e5ac8e856f61c6c1381cdc106b11334e199bb1325a8bf42be" => :sierra
    sha256 "5602be4544d6c6a214b80fde3f251e8a60150b67956b39b3d1d8534a9ee399b8" => :el_capitan
  end

  depends_on PhpMetaRequirement

  def install
    composer_install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"envoy"
  end

  test do
    system "#{bin}/envoy", "--version"
  end
end
