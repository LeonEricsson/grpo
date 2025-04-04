let
  envName = "grpo";
  venvDir = "./.venv";
  pkgs = (import (fetchTarball ("https://github.com/NixOS/nixpkgs/archive/c618e28f70257593de75a7044438efc1c1fc0791.tar.gz"))  { config.allowUnfree = true; });
  prompt = "\\[\\e[1;35m\\]${envName}\\[\\e[0m\\]|\\[\\e[1;34m\\]\\W \\$ \\[\\e[0m\\]";
in (pkgs.buildFHSEnv {
  name = "pythondev";
  targetPkgs = pkgs: (with pkgs; [
    python312Packages.python
    python312Packages.uv
    cudaPackages.cudatoolkit
    pre-commit
    zlib
    ruff
    pyright
  ]);
  runScript = "bash --rcfile <(echo '. ~/.bashrc; export PS1=\"${prompt}\"; uv sync;')";
}).env
