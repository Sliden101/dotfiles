{
  description = "my nixos config";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    lazyvim.url = "github:pfassina/lazyvim-nix";
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

};

  outputs = inputs@{ self, nixpkgs, home-manager, lazyvim, ... }:
  let
     shared = [
	./modules/alacritty
	./modules/audio.nix
	./modules/cli.nix
	./modules/desktop.nix
	./modules/dev.nix
	./modules/discord.nix
	./modules/docker.nix
	./modules/fastfetch
	./modules/git.nix
	./modules/java.nix
	./modules/mullvad.nix
	./modules/network.nix
	./modules/nvim
	./modules/python.nix
	./modules/rust.nix
	./modules/sliden.nix
	./modules/ssh.nix
	./modules/steam.nix
	./modules/telegram.nix
	./modules/zen.nix
	./modules/zsh.nix
	home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  
	  home-manager.extraSpecialArgs = {
            inherit inputs;
	  };

        }
     ];
  in {
    nixosConfigurations.lapis = nixpkgs.lib.nixosSystem {
      modules = shared ++ [
        ./configuration.nix
      ];
    };
  };
}
