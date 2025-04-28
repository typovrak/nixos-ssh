{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.ssh = ''
		# no rm for keeping credentials, adding -p
		mkdir -p ${home}/.ssh
		chown ${username}:${group} ${home}/.ssh
		chmod 700 ${home}/.ssh
	'';

	environment.systemPackages = with pkgs; [
		openssh
	];
	
	services.openssh.enable = true;
}
