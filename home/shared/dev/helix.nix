{
  pkgs,
  inputs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.hostPlatform.system}.default;
    settings = {
      theme = "kanagawa";
      editor = {
        mouse = false;
        middle-click-paste = false;
        cursorline = true;
        end-of-line-diagnostics = "error";
        # auto-pairs = false;
        idle-timeout = 0;
        lsp = {
          display-progress-messages = true;
          auto-signature-help = false; # https://github.com/helix-editor/helix/discussions/6710
        };
        inline-diagnostics = {
          cursor-line = "hint";
          # other-lines = "error";
        };
        smart-tab = {
          enable = false;
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
      keys = {
        normal = {
          "%" = ["save_selection" "select_all"];
          "n" = ["save_selection" "search_next"];
          "N" = ["save_selection" "search_prev"];
          "g" = {x = [":sh ${pkgs.gh}/bin/gh browse %{buffer_name}:%{cursor_line} -c%sh{latest_pushed_commit}"];};
        };
        insert = {
          "esc" = ["save_selection" "normal_mode"];
          # "C-[" = "normal_mode";
        };
      };
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
        ruff = {
          config = {
            settings = {
              fixAll = false;
              organizeImports = false; # do it auto, remove the annoying popup
              lint = {
                run = "onSave";
                extendSelect = ["I"];
              };
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
        typos = {
          command = "typos-lsp";
        };
      };
      language = [
        {
          name = "rust";
          language-servers = ["rust-analyzer" "typos"];
        }
        {
          name = "java";
          language-servers = ["jdt-language-server" "typos"];
          auto-format = true;
        }
        {
          name = "yaml";
          language-servers = ["yaml-language-server" "typos"];
          formatter = {
            auto-format = true;
            command = "prettier";
            args = ["--parser" "yaml"];
          };
        }
        {
          name = "toml";
          language-servers = ["taplo" "typos"];
          auto-format = true;
        }
        {
          name = "json";
          language-servers = ["vscode-json-language-server" "typos"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "json"];
          };
        }
        {
          name = "racket";
          auto-format = true;
          formatter = {
            command = "raco";
            args = ["fmt"];
          };
        }
        {
          name = "typescript";
          language-servers = ["typescript-language-server" "eslint" "typos"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
        }
        {
          name = "tsx";
          language-servers = ["typescript-language-server" "eslint" "typos"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
        }
        {
          name = "javascript";
          language-servers = ["typescript-language-server" "eslint" "typos"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
        }
        {
          name = "c";
          language-servers = ["clangd" "typos"];
          auto-format = true;
          formatter = {command = "clang-format";};
        }
        {
          name = "cpp";
          language-servers = ["clangd" "typos"];
          auto-format = true;
          formatter = {command = "clang-format";};
        }
        {
          name = "nix";
          language-servers = ["nil" "statix" "typos"];
          auto-format = true;
          formatter = {command = "alejandra";};
        }
        {
          name = "lua";
          language-servers = ["lua-language-server" "selene" "typos"];
          auto-format = true;
          formatter = {
            command = "stylua";
            args = ["--search-parent-directories"];
          };
        }
        {
          name = "python";
          language-servers = ["ruff" "pyright" "typos"];
          auto-format = true;
        }
        {
          name = "typst";
          auto-format = true;
          language-servers = ["tinymist" "typos"];
          formatter = {
            command = "typstyle";
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
