{pkgs, ...}:
{
    services = {
    ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        loadModels = [ "qwen2.5-coder:7b" "qwen3-coder:latest" ];
    };
    open-webui.enable = true;
};
}