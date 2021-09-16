module Color
  CODES = {
    black:    { hex: "#000000", rgb: "0,0,0" },
    white:    { hex: "#FFFFFF", rgb: "255,255,255" },
    red:      { hex: "#FF0000", rgb: "255,0,0" },
    lime:     { hex: "#00FF00", rgb: "0,255,0" },
    blue:     { hex: "#0000FF", rgb: "0,0,255" },
    yellow:   { hex: "#FFFF00", rgb: "255,255,0" },
    cyan:     { hex: "#00FFFF", rgb: "0,255,255" },
    magenta:  { hex: "#FF00FF", rgb: "255,0,255" },
    silver:   { hex: "#C0C0C0", rgb: "192,192,192" },
    gray:     { hex: "#808080", rgb: "128,128,128" },
    maroon:   { hex: "#800000", rgb: "128,0,0" },
    olive:    { hex: "#808000", rgb: "128,128,0" },
    green:    { hex: "#008000", rgb: "0,128,0" },
    purple:   { hex: "#800080", rgb: "128,0,128" },
    teal:     { hex: "#008080", rgb: "0,128,128" },
    navy:     { hex: "#000080", rgb: "0,0,128 " },
  }

  def self.names
    CODES.keys
  end

  module RGB
    def self.to_s(color_name)
      CODES.fetch(color_name.to_sym)[:rgb]
    end

    def self.to_a(color_name)
      CODES.fetch(color_name.to_sym)[:rgb].split(',')
    end
  end

  module RGBA
    def self.to_html(color_name, opacity = 1)
      rgba_array = RGB.to_a(color_name) + [opacity]

      return "rgba(#{ rgba_array.join(', ') })"
    end
  end

  module HEX
    def self.to_s(color_name)
      CODES.fetch(color_name.to_sym)[:hex]
    end
  end
end