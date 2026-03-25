{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bitwarden-desktop
  ];

  programs.ssh.extraConfig = ''
    Host *
      IdentityAgent ~/.bitwarden-ssh-agent.sock
  '';
}
