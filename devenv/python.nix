{ pkgs, lib, config, inputs, ... }:

let
  # Toggle to true to enable CUDA support (Remember to also set allowUnfree=true and cudaSupport=true in devenv.yaml)
  cuda = false;

  # Overlay that injects csprng into python3Packages,
  # built with or without CUDA depending on the flag above.
  csprngOverlay = final: prev: {
    python3 = prev.python3.override {
      packageOverrides = pyFinal: pyPrev: {
        csprng = pyPrev.buildPythonPackage (
          {
            pname = "csprng";
            version = "0.3.0";

            src = prev.fetchFromGitHub {
              owner = "meta-pytorch";
              repo = "csprng";
              rev = "main";
              sha256 = "sha256-DuomqknbmfvKZvRKnDFObz+NsyOg3c2o4sB3oJMxlMQ=";
            };

            format = "setuptools";
            doCheck = false;

            nativeBuildInputs = [
              pyPrev.setuptools
              pyPrev.wheel
            ] ++ lib.optionals cuda [
              prev.cudaPackages.cuda_nvcc
            ];

            propagatedBuildInputs = [
              pyPrev.torch
            ];
          }
          # CUDA-specific attributes are only evaluated when cuda = true
          // lib.optionalAttrs cuda {
            buildInputs = with prev.cudaPackages; [
              cuda_cudart
              libcublas
              libcurand
              libcufft
              libcusolver
              libcusparse
            ];

            preBuild = ''
              export CUDA_HOME=${prev.cudaPackages.cuda_nvcc}
              export TORCH_CUDA_ARCH_LIST="7.5"
              export FORCE_CUDA=1
            '';
          }
        );
      };
    };
    python3Packages = final.python3.pkgs;
  };

  extendedPkgs = pkgs.extend csprngOverlay;

in {
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/languages/
  languages.python = {
    enable = true;
    package = extendedPkgs.python3.withPackages (ps: with ps; [
      pip
      numpy
      matplotlib
      scipy
      virtualenv
      torch
      csprng
    ]);
  };
}
