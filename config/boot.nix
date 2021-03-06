{ config, pkgs, lib, ... }: {
  boot = {
    loader = {
      timeout = 0;
      systemd-boot = {
        enable = true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  systemd.targets.network-online.wantedBy = lib.mkForce [ ];
}
