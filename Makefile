recrank:
	sudo nixos-rebuild switch --flake .#melchior

upgrade:
	nix flake update

clean:
	sudo nix-collect-garbage --delete-older-than 2d
