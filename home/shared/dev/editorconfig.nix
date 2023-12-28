{
  # TODO: create script to generate editorconfig in current directory
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        indent_style = "space";
        indent_size = 4;
        end_of_line = "lf";
        charset = "utf-8";
        trim_trailing_whitespace = true;
        insert_final_newline = true;
      };
      "*.yml" = {
        indent_size = 2;
      };
      "*.lua" = {
        indent_style = "tab";
      };
    };
  };
}
