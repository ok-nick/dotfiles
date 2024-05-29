{
  pkgs,
  inputs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.hostPlatform.system}.default;
    themes = {
      kanagawa-custom = {
        inherits = "kanagawa";
        # the default one is indistinguishable from the cursor line
        "ui.selection" = {
          bg = "sumiInk4";
        };
        "ui.selection.primary" = {
          bg = "sumiInk4";
        };
      };
    };
    settings = {
      theme = "kanagawa-custom";
      editor = {
        mouse = false;
        middle-click-paste = false;
        cursorline = true;
        idle-timeout = 0;
        lsp = {
          display-messages = true;
          auto-signature-help = false; # https://github.com/helix-editor/helix/discussions/6710
        };
        indent-guides = {
          render = true;
        };
        file-picker = {
          hidden = false;
        };
        soft-wrap = {
          enable = true;
        };
        # gutters = [
        #   "diagnostics"
        #   "spacer"
        #   # "line-numbers"
        #   "spacer"
        #   "diff"
        # ];
      };
      # only works in modes, not things like fuzzy searching
      # keys = {
      #   insert = {
      #     "C-[" = "normal_mode";
      #   };
      # };
    };
    languages = {
      language-server = {
        jdt-language-server = {
          command = "jdt-language-server";
          args = ["-data" "."];
        };
        rust-analyzer = {
          config = {
            check = {
              command = "clippy";
              allTargets = true;
              # allFeatures = true;
              # targets = [
              # "aarch64-apple-darwin"
              # "x86_64-pc-windows-msvc"
              # ];
            };
            #     rustfmt = {
            #       enableRangeFormatting = true;
            #     };
            #     diagnostics = {
            #       enableExperimental = false;
            #     };
            #     inlayHints = {
            #       enable = false;
            #     };
            #     lens = {
            #       implementations = false;
            #     };
            cargo = {
              features = "all";
            };
            imports.granularity.enforce = true;
          };
        };
        lua-language-server = {
          config = {
            runtime = {
              version = "LuaJIT";
              path = [
                "?.lua"
                "?/init.lua"
              ];
            };
            diagnostics = {
              enable = false;
            };
            format = {
              enable = false;
            };
            telemetry = {
              enable = false;
            };
          };
        };
        selene = {
          command = "efm-langserver";
          config = {
            languages = {
              lua = [
                {
                  lintCommand = "selene --display-style quiet -";
                  # TODO
                  lintFormats = [""];
                }
              ];
            };
          };
        };
        eslint = {
          # https://github.com/helix-editor/helix/issues/3520#issuecomment-1439987347
          command = "vscode-eslint-language-server";
          args = ["--stdio"];
          config = {
            quiet = false;
            validate = "on";
            rulesCustomizations = [];
            run = "onSave";
            problems = {shortenToSingleLine = false;};
            nodePath = "";
            onIgnoredFiles = "off";
            experimental = {
              useFlatConfig = false;
            };
            codeAction = {
              disableRuleComment = {
                enable = true;
                location = "separateLine";
              };
              showDocumentation = {
                enable = true;
              };
            };
          };
        };
        nixd = {
          command = "nixd";
        };
        statix = {
          command = "efm-langserver";
          config = {
            languages = {
              nix = [
                {
                  # https://github.com/creativenull/efmls-configs-nvim/blob/ddc7c542aaad21da594edba233c15ae3fad01ea0/lua/efmls-configs/linters/statix.lua
                  lintCommand = "statix check --stdin --format=errfmt";
                  lintStdIn = true;
                  lintIgnoreExitCode = true;
                  lintFormats = ["<stdin>>%l:%c:%t:%n:%m"];
                  rootMarkers = [
                    "flake.nix"
                    "shell.nix"
                    "default.nix"
                  ];
                }
              ];
            };
          };
        };
        deadnix = {
          command = "efm-langserver";
          config = {
            languages = {
              nix = [
                {
                  lintCommand = "deadnix --output-format=json \$FILENAME";
                  # TODO
                  lintFormats = [""];
                }
              ];
            };
          };
        };
        ruff-lsp = {
          command = "ruff-lsp";
          config = {
            settings = {
              fixAll = false;
              organizeImports = false; # do it auto, remove the annoying popup
              lint.run = "onSave";
            };
          };
        };
        clangd = {
          command = "clangd";
          args = ["--clang-tidy"];
        };
        svls = {
          command = "svls";
        };
      };
      language = [
        {
          name = "java";
          auto-format = true;
          language-servers = ["jdt-language-server"];
        }
        {
          name = "yaml";
          formatter = {
            auto-format = true;
            command = "prettier";
            args = ["--parser" "yaml"];
          };
        }
        {
          name = "toml";
          auto-format = true;
        }
        {
          name = "json";
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "json"];
          };
        }
        {
          name = "typescript";
          language-servers = ["typescript-language-server" "eslint"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
        }
        {
          name = "tsx";
          language-servers = ["typescript-language-server" "eslint"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
        }
        {
          name = "javascript";
          language-servers = ["typescript-language-server" "eslint"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
        }
        {
          name = "c";
          auto-format = true;
          language-servers = ["clangd"];
          formatter = {command = "clang-format";};
        }
        {
          name = "nix";
          language-servers = ["nil" "statix"];
          auto-format = true;
          formatter = {command = "alejandra";};
        }
        {
          name = "lua";
          language-servers = ["lua-language-server" "selene"];
          auto-format = true;
          formatter = {
            command = "stylua";
            args = ["--search-parent-directories"];
          };
        }
        {
          name = "python";
          language-servers = ["pyright" "ruff-lsp"];
          auto-format = true;
        }
        {
          name = "typst";
          auto-format = true;
          formatter = {
            command = "typst-fmt";
          };
        }
        {
          name = "verilog";
          # TODO: can also try: https://github.com/chipsalliance/verible
          language-servers = ["svls"];
          auto-format = true;
          formatter = {
            command = "verible-verilog-format";
            args = ["-"];
          };
        }
      ];
    };
  };
}
