{pkgs, ...}:
{
    hardware.graphics = { # renamed from hardware.opengl
        enable = true;
    };
    environment.systemPackages = with pkgs; [
     glfw
    ];
}