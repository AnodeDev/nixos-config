{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "none";
        dynamic_padding = true;
        padding = {
          x = 10;
          y = 10;
        };
      };

      scrolling.history = 10000;

      font = {
        normal.family = "Maple Mono NF";
        bold.family = "Maple Mono NF";
        italic.family = "Maple Mono NF";
      };

      draw_bold_text_with_bright_colors = true;
    };
  };
}
