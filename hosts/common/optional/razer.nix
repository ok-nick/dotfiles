{inputs, ...}: {
  imports = [
    inputs.razer-laptop-control.nixosModules.default
  ];

  services.razer-laptop-control.enable = true;

  # https://github.com/phush0/razer-laptop-control-no-dkms/blob/dbb9d230187d3cec8217d3d2fd5e0b133582d281/razer_control_gui/src/config.rs#L5-L6
  # TODO: https://github.com/phush0/razer-laptop-control-no-dkms/issues/32
}
