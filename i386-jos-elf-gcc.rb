class I386JosElfGcc < Formula
  homepage "http://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-4.9.2/gcc-4.9.2.tar.bz2"
  mirror "ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.bz2"
  sha1 "79dbcb09f44232822460d80b033c962c0237c6d8"

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'

  def install
    target = 'i386-jos-elf'
    mkdir 'build' do
      system '../configure', "--target=#{target}",
                             '--disable-nls',
                             '--disable-werror',
                             "--prefix=#{prefix}",
                             '--enable-languages=c',
                             '--without-headers'
      system 'make all-gcc'
      system 'make install-gcc'
    end
  end
end
