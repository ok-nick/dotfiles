# alacritty config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\AppData\Roaming\alacritty" -Target (Resolve-Path -Path ".\alacritty")

# nvim config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\AppData\Local\nvim" -Target (Resolve-Path -Path ".\nvim")

# vale config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\.vale.ini" -Target (Resolve-Path -Path ".\vale\.vale.ini")

# komorebi config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\komorebi" -Target (Resolve-Path -Path ".\komorebi")

# broot config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\AppData\Roaming\dystroy\broot\config\conf.toml" -Target (Resolve-Path -Path ".\broot\conf.toml")

# firefox UI theme
New-Item -ItemType SymbolicLink -Path ((Resolve-Path -Relative "$env:UserProfile\AppData\Roaming\Mozilla\Firefox\Profiles\*.default-release") + "\chrome") -Target (Resolve-Path -Path ".\firefox")

# tridactyl
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\.tridactylrc" -Target (Resolve-Path -Path ".\tridactyl\tridactylrc")
