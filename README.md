# nixos-ssh

nixos-ssh = fetchGit {
	url = "https://github.com/typovrak/nixos-ssh.git";
	ref "main";
}

(import "${nixos-ssh}/configuration.nix")
