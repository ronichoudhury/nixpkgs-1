# This file was generated by https://github.com/kamilchm/go2nix v1.2.0
{ pkgs ? import <nixpkgs> {}, stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

# TODO: Add a service for gcp-cups-connector and perhaps some other
# kind of configuration for the same thing that gcp-connector-util
# provides.

buildGoPackage rec {
  name = "cloud-print-connector-unstable-${version}";
  version = "2017-01-19";
  rev = "481ad139cc023a3ba65e769f08f277368fa8a5de";

  goPackagePath = "github.com/google/cloud-print-connector";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/google/cloud-print-connector";
    sha256 = "0syq7s8qjspq33qd9ibvz0kwc1zxyh9jkhk7khdvgfv6n0dvql86";
  };

  goDeps = ./deps.nix;

  buildInputs = [ pkgs.avahi pkgs.cups ];
  
  meta = with stdenv.lib; {
    description = "Share printers from your Windows, Linux, FreeBSD or OS X computer with ChromeOS and Android devices, using the Cloud Print Connector";
    homepage = https://github.com/google/cloud-print-connector;
    license = licenses.bsd3;
    maintainers = with maintainers; [ hodapp ];
    # TODO: Fix broken build on OS X.  The GitHub presently lists the
    # FreeBSD build as broken too, but this may change in the future.
    platforms = platforms.linux;
  };  
}
