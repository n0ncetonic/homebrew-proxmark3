class Proxmark3 < Formula
#  desc "Proxmark3 client, flasher, HID flasher and firmware bundle"
  desc "[icemanfork] Proxmark3 client, CDC flasher and firmware bundle"
  homepage "http://www.proxmark.org"
  url "https://github.com/iceman1001/proxmark3/archive/v1.7.0.tar.gz"
  sha256 "42d6bfc3823128d3886e85af65a925795497fb2e0b317ef22bd4c9b4e49a5083"
  head "https://github.com/iceman1001/proxmark3.git"

											   

  depends_on "automake" => :build
  depends_on "readline"
  depends_on "p7zip" => :build
  depends_on "libusb"
  depends_on "libusb-compat"
  depends_on "pkg-config" => :build
  depends_on "wget"
  depends_on "qt5"
  depends_on "perl"
  depends_on "iceman1001/proxmark3/arm-none-eabi-gcc" => :build

  def install
    ENV.deparallelize

#    system "make", "-C", "client/hid-flasher/"
    system "make", "clean"	  
    system "make", "all"
    bin.mkpath
    bin.install "client/flasher" => "proxmark3-flasher"
#    bin.install "client/hid-flasher/flasher" => "proxmark3-hid-flasher"
    bin.install "client/proxmark3" => "proxmark3"
    bin.install "client/fpga_compress" => "fpga_compress"
    share.mkpath
    (share/"firmware").mkpath
    (share/"firmware").install "armsrc/obj/fullimage.elf" => "fullimage.elf"
    (share/"firmware").install "bootrom/obj/bootrom.elf" => "bootrom.elf"
#    ohai "Install success! Upgrade devices on HID firmware with proxmark3-hid-flasher, or devices on more modern firmware with proxmark3-flasher."
	ohai "Install success!  Only proxmark3-flasher (modern firmware) is available."
    ohai "The latest bootloader and firmware binaries are ready and waiting in the current homebrew Cellar within share/firmware."
  end

  test do
    system "proxmark3", "-h"
  end
end
