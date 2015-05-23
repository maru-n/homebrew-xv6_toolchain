class I386JosElfBinutils < Formula
  homepage "http://www.gnu.org/software/binutils/binutils.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.25.tar.gz"
  mirror "http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz"
  sha1 "f10c64e92d9c72ee428df3feaf349c4ecb2493bd"

  depends_on 'gcc' => :build

  def install
    target = 'i386-jos-elf'
    mkdir 'build' do
      system '../configure', "--target=#{target}",
                             '--disable-nls',
                             '--disable-werror',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'

    end
    # Avoid conflict with original binutils by homebrew.
    Dir.glob(info/'*') { |file| add_preffix file, target }
  end

  def add_preffix(file, preffix)
    dir = File.dirname(file)
    ext = File.extname(file)
    base = File.basename(file, ext)
    File.rename file, "#{dir}/#{preffix}-#{base}#{ext}"
  end

end
