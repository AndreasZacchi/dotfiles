{ pkgs, ... } : {
    environment.systemPackages = with pkgs; [
     wget 
     gnome.gnome-keyring
     libsecret
     gnome.seahorse
     vscode.fhs
     alacritty
     git
     gh
  ];
}

# VSCODE REPRODUCIBLE
     #(vscode-with-extensions.override {
  # When the extension is already available in the default extensions set.
  #vscodeExtensions = with vscode-extensions; [
  #  bbenoist.nix
  #];
  # Concise version from the vscode market place when not available in the default set.
  #++ vscode-utils.extensionsFromVscodeMarketplace [
  #  {
  #    name = "code-runner";
  #    publisher = "formulahendry";
  #    version = "0.6.33";
  #    sha256 = "YFEQXFI2EFxumdpRd5gE1RTb8DgqYFJhYoWyvMdR0Zg=";
  #  }
  #];
#})
