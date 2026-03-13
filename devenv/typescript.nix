{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/languages/
  languages.javascript.enable = true;
  languages.javascript.npm.enable = true;
  languages.typescript.enable = true;

  # https://devenv.sh/basics/
  enterShell = ''
    echo "Loaded NodeJS version: $(node --version) with TS version: $(tsc --version)"
  '';
}
