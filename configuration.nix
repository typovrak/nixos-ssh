{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.ssh = ''
		mkdir -p ${home}/.ssh
		chown ${username}:${group} ${home}/.ssh
		chmod 700 ${home}/.ssh
	'';

	environment.systemPackages = with pkgs; [
		openssh
	];
	
	services.openssh.enable = true;
}
