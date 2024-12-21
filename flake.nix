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
          ];

          LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
            alsa-lib
            at-spi2-core
            cairo
            cups
            dbus
            expat
            libdrm
            libxkbcommon
            mesa
            nspr
            nss
            pango
            systemd
            xorg.libX11
            xorg.libXcomposite
            xorg.libXdamage
            xorg.libXext
            xorg.libXfixes
            xorg.libXrandr
            xorg.libxcb
          ];
        };
      }
    );
}
