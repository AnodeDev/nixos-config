{config, ...}: {
  # Environment variables
  home.sessionVariables = {
    GNUPGHOME = "${config.home.homeDirectory}/Personal/Secret/.gnupg";
  };
}
