{config, lib, ...}: {
  # Environment variables
  home.sessionVariables = {
    GNUPGHOME = lib.mkForce "${config.home.homeDirectory}/Personal/Secret/.gnupg";
  };
}
