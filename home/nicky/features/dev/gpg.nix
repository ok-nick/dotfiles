{
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  programs = {
    gpg = {
      enable = true;
      settings = {
        trust-model = "tofu+pgp";
      };
      publicKeys = [
        {
          # ok-nick
          text = ''
            -----BEGIN PGP PUBLIC KEY BLOCK-----

            mDMEZA7Y6xYJKwYBBAHaRw8BAQdAoTKmLn83++fbhLcL7MSFjtYtbxD1iaVJ+uEj
            mO0QDwq0Im9rLW5pY2sgPG5pY2subGlicmFyaWVzQGdtYWlsLmNvbT6IjgQTFgoA
            NhYhBPpxl7WAgCFnDeLBrObz9yJTBgDSBQJkDtjrAhsDBAsJCAcEFQoJCAUWAgMB
            AAIeBQIXgAAKCRDm8/ciUwYA0g7MAQCmfTtfBigG27hiUUiPuy+K11fW/LUrvuZe
            lGY/RLZe5AD9E/iRKPmFxV8NtnZaJ2/FcB6T97MFs1hobsHoTl6drwG4OARkDtjr
            EgorBgEEAZdVAQUBAQdAPfg1Ucjninw7A+eT6eXVabJ1YRlGRFuTm7s1NXzbMFgD
            AQgHiHgEGBYKACAWIQT6cZe1gIAhZw3iwazm8/ciUwYA0gUCZA7Y6wIbDAAKCRDm
            8/ciUwYA0rReAP9ysbM6u6CIYbNVIoBlnfX5HMjvFijjpqwESIpBOZgHGgEAiDO3
            peL7vdP4FIc7Z8Qw93nN1T9PuPCtziIGd2hCOQc=
            =skHb
            -----END PGP PUBLIC KEY BLOCK-----
          '';
          trust = 5;
        }
        {
          # nmsalvem
          text = ''
            -----BEGIN PGP PUBLIC KEY BLOCK-----

            mDMEZO+kEBYJKwYBBAHaRw8BAQdAuNZoK3b8vyhOEUBOoip5mdHJS5Ibk/Z3xcN+
            Nps+QjK0I25tc2FsdmVtIDxuaWNrLnNjaG9sYXJseUBnbWFpbC5jb20+iI4EExYK
            ADYWIQSpVJJNpteYF4+yJLtktdqlw5eP/QUCZO+kEAIbAwQLCQgHBBUKCQgFFgID
            AQACHgUCF4AACgkQZLXapcOXj/2M4AEAv31+ldMGbkDrzmHkUP7n50O8U1VTC4aw
            /zM/mhSA58EBAJ9HsFDDitNhS5sehvocL/NERfhP9hTb8/jpJHZemK0HuDgEZO+k
            EBIKKwYBBAGXVQEFAQEHQPSMRDstOTfqaYPYFqrwHqj0CnyOV6F+pC5Fz8dStPUj
            AwEIB4h4BBgWCgAgFiEEqVSSTabXmBePsiS7ZLXapcOXj/0FAmTvpBACGwwACgkQ
            ZLXapcOXj/0FWQEAjJLaiMSXohx5j5t7Vk8ZZJDaQaOCAxBcVOql655s4VcBAITz
            6xAru/9LBYIal10ifrWptqPKYZuNNQxWo0K74UYC
            =p0vL
            -----END PGP PUBLIC KEY BLOCK-----
          '';
          trust = 5;
        }
      ];
    };
  };
}
