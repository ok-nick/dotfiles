# `dotfiles`

A summation of all my system/program dotfile configurations.

## Devices
| Name | Device | RAM | CPU | GPU |
| - | - | - | - | - |
| mapro | Macbook Pro 14" | 18GB | M3 Pro | Integrated |
| icarus | Razer Blade 15" | 16GB | i7-10875H | RTX 2080 Super |

## Structure
    .
    ├── home                    # home-manager configs
    │   ├── nicky               # user-level configs for each system
    │   │   ├── icarus.nix      # user-level config for the icarus device
    │   │   └── mapro.nix       # user-level config for the mapro device
    │   └── shared              # shared user-level program configs among users
    │       ├── desktop         # configs for general programs
    │       │   ├── wayland     # configs specific to Wayland
    │       │   │   └── ...
    │       │   ├── wms         # configs for each window manager
    │       │   │   └── ...
    │       │   └── ...
    │       ├── dev             # dev tool configs
    │       │   └── ...
    │       └── games           # game configs
    │           └── ...
    ├── hosts                   # system-level configs
    │   ├── nix-darwin          # configs for nix-darwin
    │   │   ├── mapro           # system-level config for the mapro device
    │   │   │   └── ...
    │   │   └── shared          # shared system-level configs for nix-darwin
    │   │       ├── users       # user creation config
    │   │       │   └── ...
    │   │       └── ...
    │   ├── nixos               # configs for nixos
    │   │   ├── icarus          # system-level config for the icarus device
    │   │   │   └── ...
    │   │   └── shared          # shared system-level configs for nix-darwin
    │   │       ├── users       # user creation config
    │   │       │   └── ...
    │   │       └── ...
    │   └── shared              # shared system-level configs for nixos and nix-darwin
    │       └── ...
    ├── modules                 # custom modules for home-manager/nixos/nix-darwin
    │   ├── home-manager        # custom modules for home-manager
    │   │   └── ...
    │   ├── nix-darwin          # custom modules for nix-darwin
    │   │   └── ...
    │   └── nixos               # custom modules for nixos
    │       └── ...
    ├── overlays                # package overlays for nixpkgs
    │   └── ...
    ├── pkgs                    # custom packages
    │   └── ...
    ├── .gitignore
    ├── .sops.yaml              # TODO
    ├── flake.lock
    ├── flake.nix               # entry point for everything flakes
    ├── LICENSE
    └── README.md
