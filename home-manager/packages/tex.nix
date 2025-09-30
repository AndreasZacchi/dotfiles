{ config, pkgs, ... }:

{
  programs.texlive = {
    enable = true;

    # Provide a function that selects TeX Live packages.
    # HM will build pkgs.texlive.combine for you.
    extraPackages = tpkgs: {
      inherit (tpkgs)
        scheme-medium
        collection-latexrecommended
        collection-fontsrecommended
        collection-langenglish
        collection-langeuropean
        collection-mathscience
        collection-latexextra
        collection-pictures
        latexmk;   # handy tool
    };
  };
}