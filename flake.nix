{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            gccgo13
            pkg-config
            glib.dev
            cmake
            gnumake
            gst_all_1.gstreamer.dev
            gst_all_1.gst-plugins-base.dev
            xorg.libX11.dev
            xorg.libXrandr.dev
            xorg.libXcomposite.dev
            xorg.libXdamage.dev
            xorg.libXext.dev
            xorg.libXfixes.dev
            nss.dev
            nspr.dev
          ];
        };
      }
    );
}
