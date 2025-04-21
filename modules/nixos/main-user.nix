{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";
    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };
    shell = lib.mkOption {
      default = pkgs.shadow;
      description = ''
        user shell
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "main user";
      extraGroups = [
        "wheel"
        "networkManager"
        "plugdev"
      ];
      shell = cfg.shell;
      ignoreShellProgramCheck = true;
    };
  };
}
