{pkgs, ...}:
{
    home.packages = with pkgs; [
		dotnetCorePackages.dotnet_10.sdk
	];
}