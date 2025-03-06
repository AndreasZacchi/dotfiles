{ config, pkgs, ... }:

{
  #imports =
  #  [
  #    ./packages/git.nix
  #    
  #    ./WM/i3.nix
  #  ];
  # TODO please change the username & home directory to your own
  home.username = "andreaszacchi";
  home.homeDirectory = "/home/andreaszacchi";

  xsession.windowManager.i3 = {
   enable = true;
    config = {
      modifier = "Mod4";
      floating.modifier = "Mod4";
      
      # default workspaces for certain applications
      assigns = {
        "1" = [{ class = "^Code$"; }];
        "2" = [{ class = "^Firefox$"; }];
        "3" = [{ class = "^Alacritty$"; }];
        "4" = [{ class = "^Discord$"; }];
        "5" = [{ class = "^Spotify$"; }];
      };
 
      keybindings = {
       "Mod4+c" = "kill";
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";
        "Mod4+Left" = "focus left";
        "Mod4+Down" = "focus down";
        "Mod4+Up" = "focus up";
        "Mod4+Right" = "focus right";
        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";
        "Mod4+Shift+Left" = "move left";
        "Mod4+Shift+Down" = "move down";
        "Mod4+Shift+Up" = "move up";
        "Mod4+Shift+Right" = "move right";        

        "Mod4+f" = "fullscreen toggle";
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+Shift+c" = "reload";
        "Mod4+Shift+r" = "restart";       

       "Mod4+Return" = "exec alacritty -o font.size=12";
       "Mod4+b" = "exec firefox";
       "Mod4+p" = "exec rofi -show drun -show-icons";
       "Mod4+Shift+f" = "exec thunar";
       "Mod4+Shift+g" = "exec firefox https://github.com/AndreasZacchi?tab=repositories";
       "Mod4+v" = "exec zsh -c 'source ~/.zshrc && code'";


       "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace number 10";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";
      };
    };
  };

  # basic configuration of git, please change to your own
    programs.git = {
        enable = true;
        userName = "Andreas V. W. Zacchi";
        userEmail = "zacchiandreas@gmail.com";
    };
    #programs.git-credential-oauth.enable = true;
    programs.gh.enable = true;

   # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    python3
    evince

    discord
    vscode.fhs
    rofi
    git
    gh
   # git-credential-manager
    spotify

    neofetch
    nnn # terminal file manager

    # archives
    zip
    unzip

 # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    which
    file

    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs.spotify-player.enable = true;

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 15;

      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}

