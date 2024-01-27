{
  
  inputs.proj1.url = "git+ssh://git@github.com/RichardWarfield/proj1.git";

  outputs = { self, nixpkgs, proj1 }: {
    defaultPackage.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
      name = "hello-world-lib";
      src = ./.;
      buildPhase = ''
        cc -o hello_world ${proj1.defaultPackage.x86_64-linux}/hello_world.o
      '';

      installPhase = ''
        mkdir -p $out
        mv hello_world $out/
      '';
    };
  };
}
