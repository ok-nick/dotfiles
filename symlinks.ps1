# alacritty config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\AppData\Roaming\alacritty" -Target "..\alacritty" 

# nvim config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\AppData\Local\nvim" -Target "..\nvim" 

# vale config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\.vale.ini" -Target "..\value\.vale.ini" 

# komorebi config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\komorebi" -Target "..\komorebi" 

# broot config
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\AppData\Roaming\dystroy\broot\config\conf.toml" -Target "..\broot\conf.toml" 

# firefox UI theme
New-Item -ItemType SymbolicLink -Path "$env:UserProfile\AppData\Mozilla\Firefox\Profiles\*.default-release\chrome" -Target "..\firefox\"