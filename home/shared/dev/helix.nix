{
  pkgs,
  inputs,
  ...
}: let
  # kinda annoying but it'll have to do
  # TODO: make sure to keep it updated for now
  typst-ts-rev = "791cac478226e3e78809b67ff856010bde709594";
in {
  # copy queries folder according to instructions
  # https://github.com/uben0/tree-sitter-typst/tree/master#helix
  xdg.configFile."helix/runtime/queries/typst" = let
    repo = builtins.fetchGit {
      url = "https://github.com/uben0/tree-sitter-typst";
      rev = typst-ts-rev;
    };
  in {
    source = "${repo}/queries";
  };

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
    };
    languages = {
      grammar = [
        {
          name = "typst";
          source = {
            git = "https://github.com/uben0/tree-sitter-typst";
            rev = typst-ts-rev;
          };
        }
      ];

      language-server = {
        jdt-language-server = {
          command = "jdt-language-server";
          args = ["-data" "."];
        };
        typst-lsp = {
          command = "typst-lsp";
        };
        rust-analyzer = {
          config = {
            check = {
              command = "clippy";
              # allFeatures = true;
              targets = [
                "aarch64-apple-darwin"
                "x86_64-pc-windows-msvc"
              ];
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
        eslint-javascript = {
          command = "efm-langserver";
          config = {
            languages = {
              javascript = [
                {
                  lintCommand = "eslint -f visualstudio --stdin --stdin-filename \${INPUT}";
                  lintIgnoreExitCode = true;
                  lintStdIn = true;
                  lintFormats = [
                    "%f(%l,%c): %tarning %m"
                    "%f(%l,%c): %rror %m"
                  ];
                }
              ];
            };
          };
        };
        eslint-typescript = {
          command = "efm-langserver";
          config = {
            languages = {
              typescript = [
                {
                  lintCommand = "eslint -f visualstudio --stdin --stdin-filename \${INPUT}";
                  lintIgnoreExitCode = true;
                  lintStdIn = true;
                  lintFormats = [
                    "%f(%l,%c): %tarning %m"
                    "%f(%l,%c): %rror %m"
                  ];
                }
              ];
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
          language-servers = ["typescript-language-server" "eslint-typescript"];
          auto-format = true;
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
        }
        {
          name = "javascript";
          language-servers = ["typescript-language-server" "eslint-javascript"];
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
          scope = "source.typst";
          injection-regex = "^typ(st)?$";
          file-types = ["typ"];
          comment-token = "//";
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          auto-pairs = {
            "(" = ")";
            "{" = "}";
            "[" = "]";
            "\"" = "\"";
            "`" = "`";
            "$" = "$";
          };
          roots = ["typst.toml"];
          language-servers = ["typst-lsp"];
          auto-format = true;
          formatter = {
            command = "typst-fmt";
          };
        }
      ];
    };
  };
}
