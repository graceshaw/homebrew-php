require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php71Lua < AbstractPhp71Extension
  init
  desc "This extension embeds the lua interpreter.."
  homepage "https://pecl.php.net/package/lua"
  url "https://pecl.php.net/get/lua-2.0.5.tgz"
  sha256 "bb49431ce5494ebebba98d9c477537df97234e13d4bd46529809ca1a2b8c287e"
  head "https://github.com/laruence/php-lua.git"

  bottle do
    sha256 "dac413eacb1373d45f0c088b828c53bf2bbb9250c836135967534a52d4301374" => :sierra
    sha256 "56ab1fef692127db2b0fa6402e6a322a528b9becfb775eaf5bec8ea16bd6edc1" => :el_capitan
    sha256 "7262d3b0456abe253609eaa207b90f9645fd10358538f43aa1db3956652cc5dd" => :yosemite
  end

  depends_on "lua"

  def install
    Dir.chdir "lua-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-lua=#{Formula["lua"].opt_prefix}"
    system "make"
    prefix.install "modules/lua.so"
    write_config_file if build.with? "config-file"
  end
end
