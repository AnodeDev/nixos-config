{pkgs, ...}: {
  programs.gpg = {
    enable = true;
    settings = {
      personal-digest-preferences = "SHA512 SHA384 SHA256";
      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
      require-secmem = true;
      s2k-cipher-algo = "AES256";
      s2k-digest-algo = "SHA512";
      s2k-count = "65011712";
      use-agent = true;
      keyserver = "hkps://keys.openpgp.org";
      keyserver-options = "auto-key-retrieve";
      no-comments = true;
      no-emit-version = true;
      # tofu-policy = "good";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 600;
    maxCacheTtl = 7200;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
