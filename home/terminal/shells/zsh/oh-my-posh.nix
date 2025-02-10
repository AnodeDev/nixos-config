{

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      palette = {
        gray = "#7f849c";
        mauve = "#cba6f7";
        peach = "#fab387";
        sapphire = "#74c7ec";
      };

      transient_prompt = {
        template = "❯ ";
        foreground = "p:mauve";
        background = "transparent";
      };

      secondary_prompt = {
        template = "❯❯ ";
        foreground = "magenta";
        background = "transparent";
      };

      blocks = [
        {
          type = "prompt";
          alignment = "left";
          newline = true;

          segments = [
            {
              template = "{{ .Path }}";
              foreground = "p:sapphire";
              background = "transparent";
              type = "path";
              style = "plain";

              properties = {
                cache_duration = "none";
                style = "full";
              };
            }
            {
              template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";
              foreground = "p:gray";
              background = "transparent";
              type = "git";
              style = "plain";
              foreground_templates = [
                "{{ if or (.working.Changed) (.Staging.Changed) }}red{{ end }}"
                "{{ if and (gt .Ahead 0) (gt .Behind 0) }}p:peach{{ end }}"
                "{{ if gt .Ahead 0 }}red{{ end }}"
                "{{ if gt .Behind 0 }}yellow{{ end }}"
              ];

              properties = {
                branch_icon = "";
                cache_duration = "none";
                commit_icon = "";
                fetch_status = true;
              };
            }
          ];
        }
        {
          type = "rprompt";
          overflow = "hidden";

          segments = [
            {
              template = "{{ .FormattedMs }}";
              foreground = "yellow";
              background = "transparent";
              type = "executiontime";
              style = "plain";

              properties = {
                cache_duration = "none";
                threshold = 5000;
              };
            }
          ];
        }
        {
          type = "prompt";
          alignment = "left";
          newline = true;

          segments = [
            {
              template = "❯ ";
              foreground = "p:mauve";
              background = "transparent";
              type = "text";
              style = "plain";

              properties = {
                cache_duration = "none";
              };
            }
          ];
        }
      ];
    };
  };
}
