nixrebuild:
	doas nixos-rebuild switch --flake .

hmswitch:
	home-manager switch --flake .

update:
	nix flake update --commit-lock-file
	make hmswitch
	make nixrebuild

