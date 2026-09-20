{pkgs, ...}:
{
    services = {
    ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        loadModels = [ "qwen3.5:9b" ];
    };
    open-webui.enable = true;
};
}