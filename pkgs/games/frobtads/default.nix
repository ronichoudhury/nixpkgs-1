{ stdenv, fetchurl, ncurses, curl }:

stdenv.mkDerivation rec {
  version = "1.2.3";
  pname = "frobtads";

  src = fetchurl {
    url = "https://www.tads.org/frobtads/${pname}-${version}.tar.gz";
    sha256 = "88c6a987813d4be1420a1c697e99ecef4fa9dd9bc922be4acf5a3054967ee788";
  };

  buildInputs = [ ncurses.dev curl.dev ];

  patches = [ ./fix-pointer-type.patch ];

  meta = with stdenv.lib; {
    homepage = https://www.tads.org/frobtads.htm;
    description = "FrobTADS is a full version of TADS for Unix, Linux, and Mac OS X, by Nikos Chantziaras. It includes everything you need for playing and writing TADS games, including a text-only TADS interpreter and the compilers for both TADS 2 and 3.";
    platforms = platforms.unix;
  };
}
