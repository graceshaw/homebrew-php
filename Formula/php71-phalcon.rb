require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php71Phalcon < AbstractPhp71Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v3.2.4.tar.gz"
  sha256 "0c1cbe56aa0571bd5e3c5808ee9488b223ae0451e8f3d4eb7179a11875635e1b"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "b99abb4919125240b7996eca95ae4dc685fe91332fbc043f999f72974c01f1ff" => :high_sierra
    sha256 "ec3d4f92b48abde0b9bb098dba844f71a23a1e6aae71520576b31c1182ac83cf" => :sierra
    sha256 "24dcd7f789ee550796bb2233b1f97420dfca740a0e94eb47a1c09b5d1e819aff" => :el_capitan
  end

  depends_on "pcre"

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--enable-phalcon"
    system "make"
    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
