{ pkgs, ... }: {
  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };
  hardware = {
    opengl = {
      driSupport32Bit = true;
      driSupport = true;
    };
    nvidia = {
      powerManagement.enable = true;
      modesetting.enable = true;
      nvidiaPersistenced = true;
      forceFullCompositionPipeline = true;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      exec -a "$0" "$@"
    '')
  ];
}
