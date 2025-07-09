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

		cp ${./config} ${home}/.ssh/config
		chown ${username}:${group} ${home}/.ssh/config
		chmod 600 ${home}/.ssh/config

		cp ${./allowed_signers} ${home}/.ssh/allowed_signers
		chown ${username}:${group} ${home}/.ssh/allowed_signers
		chmod 600 ${home}/.ssh/allowed_signers
	'';

	environment.systemPackages = with pkgs; [
		openssh
	];
	
	services.openssh.enable = true;
}
