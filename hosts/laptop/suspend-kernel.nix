{ pkgs, config, ... }:
{
	boot.kernelParams = [ 
		"pcie_aspm=off"
		"pcie_port_pm=off"
		"nvme_core.default_ps_max_latency_us=0"
		"mem_sleep_default=deep"
	];
}