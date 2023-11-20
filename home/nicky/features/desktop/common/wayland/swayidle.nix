{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    events = [
      # TODO: swaylock on resume doesn't accept keyboard inputs... (when dedicated GPU enabled)
      {
        event = "before-sleep";
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock --daemonize";
      }
    ];
  };
}
