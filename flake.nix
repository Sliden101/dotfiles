{
  description = "Sliden's nix config";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    lazyvim.url = "github:pfassina/lazyvim-nix";
    opencode.url = "github:GutMutCode/opencode-nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
   };

   zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
    };
   };

   prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher";
      # Optional: follow your nixpkgs version for consistency (may disable binary cache)
      inputs.nixpkgs.follows = "nixpkgs-unstable";
   };

};

  outputs = inputs@{ self, nixpkgs, home-manager, nixpkgs-unstable, prismlauncher , ... }:
  let
      shared = [
	./modules/alacritty
	./modules/arduino.nix
	./modules/audio.nix
	./modules/bluetooth.nix
	./modules/cli.nix
	./modules/desktop.nix
	./modules/dev.nix
	./modules/discord.nix
	./modules/docker.nix
	./modules/fastfetch
	./modules/git.nix
	./modules/java.nix
	./modules/lutris.nix
	./modules/mullvad.nix
	./modules/mysql.nix
	./modules/network.nix
	./modules/nodejs.nix
	./modules/nvim
	./modules/opencode.nix
	./modules/python.nix
	./modules/rust.nix
	./modules/sliden.nix
	./modules/ssh.nix
	./modules/steam.nix
	./modules/telegram.nix
	./modules/virtualization.nix
	./modules/zen.nix
	./modules/zsh.nix
	home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

	  home-manager.extraSpecialArgs = {
            inherit inputs;
	    inherit prismlauncher;
	    unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;  # Pass unstable to home-manager
	  };

        }
      ];

      mkSystem = hostFile: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; inherit prismlauncher; unstable = nixpkgs-unstable.legacyPackages.x86_64-linux; };
        modules = shared ++ [
          ./configuration.nix
          hostFile
        ];
      };
  in {
    nixosConfigurations = {
      lapis = mkSystem ./hosts/lapis.nix;
      diamond = mkSystem ./hosts/diamond.nix;
    };
  };
}
