{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.ilia = {
    isNormalUser = true;
    home = "/home/ilia";
    extraGroups = [ "docker" "lxd" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$rounds=656000$86KNrkYXUOytOvSg$zeD4Nn6pufxz3JZmh5L9wcG.7Y/mZNSRnv6Ei/mKNqYwdGeyF7yBmRcG1cXccNZva2ybW9ti5hIoXTSFtMA4K/";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDXAW+C11agdTdDlxorFpbIbxQ/vDPHM9TO+2HKlSnJtCUL56y8EY/rE7kTPGrY3uExhuzkJ1QDlK6P1DCc24B0RzfjcHY7jYee2QDprVoFQlsCQuQY1+jHTentcoC+lM1yquz2D0H/0p7S6HxvXJmra8WXEt/mloTEN1KAnOfPSqBIFDdVAwZZ5/BOGWzW6A79U5ygoxvRxKNvy0dV3FeEATi86ZoKVi4WQw+jZXPjzK5r1Tbtgg0SUfwJecrBeMzl905ieqO/283HooVCbIJRtVe+ivfGRwMV9jRiB5Ci9YVDNY1/Pg5lVOFFJmTDik+EOpO16Pwj77ADeDYxeBTcTQ4GxwM6TlI7FdKSBw5TBoGMESuccH1h2n5ew9Ls/PA34AOYXyUb9dJWb5/9wA0oSz+77ZGtvW9e6EZqJw7ouNzFa2LdH3ENJPu72JNsXsJRbGqj85Cp2XiIQ4lTLpm1G47magaCJ5HDSzfUq5Y644awN2ccJhaMiV+Khez6f/omOuzlaR96qsm6XfNB/Jucd6DveGikUskuEZvUxZbZdZELQDGop7K7KAJBB0Go6wfO0UCOFIJvcJ7nLYRQO6rc/+8AFMtdaB5S/phI/QgoXJ09mqoefLw39D5wsNbrkbhk74EKeRSkoZ+zlG/u9wkfCnLU22l1pZ2XLn0mtRT83w== ilia"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
