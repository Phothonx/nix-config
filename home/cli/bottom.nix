{ colors, ... }:
{
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        battery = true;
        temperature_type = "c";
      };
      colors = with colors; {
        table_header_color = "#${base13}"; 
        all_cpu_color = "#${base13}";
        avg_cpu_color = "#${base12}";
        cpu_core_colors = ["#${base08}" "#${base09}" "#${base0A}" "#${base0B}" "#${base16}" "#${base0E}"];
        ram_color = "#${base0B}";
        swap_color = "#${base09}";
        rx_color = "#${base0B}";
        tx_color = "#${base08}";
        widget_title_color = "#${base07}";
        border_color = "#${base03}"; 
        highlighted_border_color = "#${base0F}";
        text_color = "#${base07}";
        graph_color = "#${base17}";
        cursor_color = "#${base0F}";
        selected_text_color = "#${base11}"; 
        selected_bg_color = "#${base0E}"; 
        high_battery_color = "#${base0B}";
        medium_battery_color = "#${base0A}";
        low_battery_color = "#${base08}"; 
        gpu_core_colors = ["#${base16}" "#${base0E}" "#${base08}" "#${base09}" "#${base0A}" "#${base0B}"];
        arc_color = "#${base15}";
      };
    };
  };
}
