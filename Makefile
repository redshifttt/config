hmswitch:
	home-manager switch --flake .

nixrebuild:
	doas nixos-rebuild switch --flake .

update:
	nix flake update --commit-lock-file
	make hmswitch
	make nixrebuild

