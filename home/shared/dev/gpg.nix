{
  pkgs,
  lib,
  ...
}: {
  services.gpg-agent = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  programs = {
    gpg = {
      enable = true;
      settings = {
        trust-model = "tofu+pgp";
      };
      # publicKeys = [
      #   {
      #     # ok-nick
      #     text = ''
      #       -----BEGIN PGP PUBLIC KEY BLOCK-----

      #       mDMEZA7Y6xYJKwYBBAHaRw8BAQdAoTKmLn83++fbhLcL7MSFjtYtbxD1iaVJ+uEj
      #       mO0QDwq0Im9rLW5pY2sgPG5pY2subGlicmFyaWVzQGdtYWlsLmNvbT6IjgQTFgoA
      #       NhYhBPpxl7WAgCFnDeLBrObz9yJTBgDSBQJkDtjrAhsDBAsJCAcEFQoJCAUWAgMB
      #       AAIeBQIXgAAKCRDm8/ciUwYA0g7MAQCmfTtfBigG27hiUUiPuy+K11fW/LUrvuZe
      #       lGY/RLZe5AD9E/iRKPmFxV8NtnZaJ2/FcB6T97MFs1hobsHoTl6drwG4OARkDtjr
      #       EgorBgEEAZdVAQUBAQdAPfg1Ucjninw7A+eT6eXVabJ1YRlGRFuTm7s1NXzbMFgD
      #       AQgHiHgEGBYKACAWIQT6cZe1gIAhZw3iwazm8/ciUwYA0gUCZA7Y6wIbDAAKCRDm
      #       8/ciUwYA0rReAP9ysbM6u6CIYbNVIoBlnfX5HMjvFijjpqwESIpBOZgHGgEAiDO3
      #       peL7vdP4FIc7Z8Qw93nN1T9PuPCtziIGd2hCOQc=
      #       =skHb
      #       -----END PGP PUBLIC KEY BLOCK-----
      #     '';
      #     trust = 5;
      #   }
      # ];
    };
  };
}
