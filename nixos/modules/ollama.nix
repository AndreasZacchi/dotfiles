{pkgs, ...}:
{
    services = {
    ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        loadModels = [ "qwen2.5-coder:7b" "qwen3.5:2b" ];
    };
    open-webui.enable = true;
};
}