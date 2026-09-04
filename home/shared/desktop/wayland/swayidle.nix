{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    events = {
      # TODO: swaylock on resume doesn't accept keyboard inputs... (when dedicated GPU enabled)
      before-sleep = "${pkgs.systemd}/bin/loginctl lock-session";
      lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
    };
  };
}
