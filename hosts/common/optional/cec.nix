{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libcec
  ];

  services.udev.extraRules = ''
    SUBSYSTEM=="tty", KERNEL=="ttyACM0", TAG+="systemd", ENV{SYSTEMD_WANTS}+="cec-start.service"
  '';

  systemd = {
    services = let
      start = ''${pkgs.bash}/bin/bash -c "echo 'on 0.0.0.0' | ${pkgs.libcec}/bin/cec-client --single-command --type r --base 0 --port 4 /dev/ttyACM0"'';
      stop = ''${pkgs.bash}/bin/bash -c "echo 'standby 0.0.0.0' | ${pkgs.libcec}/bin/cec-client --single-command --type r --base 0 --port 4 /dev/ttyACM0"'';
      device_path = /dev/ttyACM0;
    in {
      cec-start = {
        enable = true;
        description = "Start CEC device";
        after = ["sleep.target"];
        unitConfig = {
          ConditionPathExists = device_path;
        };
        serviceConfig = {
          Type = "oneshot";
          ExecStart = start;
          TimeoutSec = 10;
          Restart = "on-failure";
        };
        wantedBy = ["sleep.target"];
      };
      cec-suspend = {
        enable = true;
        description = "Stop CEC device on suspend";
        before = ["sleep.target"];
        unitConfig = {
          ConditionPathExists = device_path;
        };
        serviceConfig = {
          Type = "oneshot";
          ExecStart = stop;
          TimeoutSec = 10;
          Restart = "on-failure";
        };
        wantedBy = ["sleep.target"];
      };
      cec-shutdown = {
        enable = true;
        description = "Stop CEC device on shutdown";
        before = ["multi-user.target"];
        unitConfig = {
          ConditionPathExists = device_path;
        };
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStop = stop;
          TimeoutSec = 10;
          Restart = "on-failure";
        };
        wantedBy = ["multi-user.target"];
      };
    };
  };
}
