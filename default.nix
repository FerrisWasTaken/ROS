{
  pkgs ? import <nixpkgs> {}
}:
pkgs.stdenv.mkDerivation rec {
  pname = "ros";
  version = "0.1.0";

  buildInputs = [
    pkgs.rustc
    pkgs.cargo
    pkgs.cargo-bootimage
  ];

  src = ./.;
  PATH = "$PATH:~/.cargo/bin";
  CARGO_MANIFEST_DIR = ./.;
  outputHash = "eace0d53c3014b8b386933852249810fb55a1f9083afaa0e8bcfb002b7bd17f7";
  outputHashAlgo = "sha256";
  outputHashMode = "flat";

  configurePhase = ''
  '';

  buildPhase = ''
    cargo bootimage --release
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv /target/x86_64-ros/release/bootimage-ros.bin $out/bin
  '';
}
