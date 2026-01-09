{pkgs, inputs, ...}:
{
    programs.niri = {
        enable = true;
        package = pkgs.niri;
    };

    # imports = [
    #     inputs.niri.nixosModules.niri
    # ];

    # nixpkgs.overlays = [ inputs.niri.overlays.niri ];

    # programs.niri = {
    #     enable = true;
    #     package = pkgs.niri-stable;
    # };

    # systemd.user.services.niri-flake-polkit.enable = false;



    environment.variables.NIXOS_OZONE_WL = "1";
    environment.systemPackages = with pkgs; [
      wayland-utils
      libsecret
      cage
      gamescope
      xwayland-satellite
    ];
}