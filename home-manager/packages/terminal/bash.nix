{
    programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      # Rebuilds
      nrs-home   = "sudo nixos-rebuild switch --flake .#home";
      nrs-laptop = "sudo nixos-rebuild switch --flake .#laptop";

      # GC / Store maintenance
      nix-roots = "sudo nix-store --gc --print-roots";
      nix-gc    = "sudo nix-collect-garbage -d";
      nix-opt   = "sudo nix-store --optimise";
    };
  };
}