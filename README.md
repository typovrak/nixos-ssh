# NixOS SSH

> Declarative NixOS module to initialize a secure ```~/.ssh``` directory, install OpenSSH and enable the SSH service.

## 📦 Features

- 🔒 **Secure ```.ssh``` directory :** Creates ```~/.ssh``` with ```700``` permissions and correct ownership.

- 📦 **OpenSSH installed :** Adds ```openssh``` to ```environment.systemPackages```.

- 🚀 **SSH service :** Enables and configures ```sshd``` via ```services.openssh.enable = true```.

- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild``` without overwriting existing keys.

- ⚙️ **Minimal configuration :** Zero-friction setup with sensible defaults.
 
- 💾 **No backup needed :** No ```rm -rf``` in this module.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-ssh = fetchGit {
    url = "https://github.com/typovrak/nixos-ssh.git";
    ref = "main";
    rev = "d6e3dd9221f7808180924a9cd3dfa5c663bbec4b"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-ssh}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Verify SSH directory
```bash
ls -ld ~/.ssh # should show drwx------ and your user as owner
```

Then place your private keys in ```~/.ssh```, they will be preserved across rebuilds.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
