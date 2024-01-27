{
  
  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
      name = "hello-world-lib";
      src = ./.;
      buildPhase = ''
        cc -o hello_world ./proj1/src/hello_world.c
      '';

      installPhase = ''
        mkdir -p $out
        mv hello_world $out/
      '';
    };

    hydraJobs.proj2.x86_64-linux = self.defaultPackage.x86_64-linux;
  };
}
