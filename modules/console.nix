{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };
  environment.systemPackages = with pkgs; [
    nano
    wget
    curl
    pciutils
    htop
    lsof
    killall
    xorg.xwininfo
    xorg.xkill
    xsel
    imagemagick
    ffmpeg
    file
    nix-info
    nix-top
    man-pages
  ];
  console = {
    packages = [ pkgs.terminus_font ];
    font = "ter-v28b";
    useXkbConfig = true;
    earlySetup = true;
  };

}
