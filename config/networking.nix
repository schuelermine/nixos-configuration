{ pkgs, lib, config, ... }: {
  services.resolved = {
    enable = true;
    dnssec = "true";
  };
  networking.nameservers = [
    "1.1.1.1#cloudflare-dns.com"
    "1.0.0.1#cloudflare-dns.com"
    "2606:4700:4700::1111#cloudflare-dns.com"
    "2606:4700:4700::1001#cloudflare-dns.com"
  ];
}
