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
  outputHash = "23ebe1a4b801802ab62c8a024cfb6cff89b9e06dab15fc094b05547fc67755db";
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
