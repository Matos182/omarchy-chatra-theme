-- Chatra — overlapping saa-paper parasols.
-- Focused windows glow like a lantern under silk. Borders spin like ribs.

local active_border_color = {
  colors = { "rgba(c75f8cee)", "rgba(5c7eb0ee)", "rgba(7a9a72ee)" },
  angle = 45,
}
local inactive_border_color = "rgba(2a222888)"

hl.config({
  general = {
    gaps_in = 6,
    gaps_out = 14,
    border_size = 2,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    rounding = 3,
    rounding_power = 2,

    -- Unfocused parasols fall into the stall's shadow.
    dim_inactive = true,
    dim_strength = 0.20,

    glow = {
      enabled = true,
      range = 16,
      render_power = 3,
      color = "rgba(c75f8c44)",
      color_inactive = "rgba(1a121818)",
    },

    shadow = {
      enabled = true,
      range = 14,
      render_power = 3,
      color = "rgba(5c7eb033)",
      color_inactive = "rgba(06050699)",
    },

    -- Night-market haze between overlapping paper.
    blur = {
      enabled = true,
      size = 5,
      passes = 2,
      vibrancy = 0.16,
      contrast = 0.90,
      brightness = 0.76,
      noise = 0.018,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Paper unfolding, a rib springing, silk settling.
hl.curve("unfold", { type = "bezier", points = { { 0.16, 1.0 }, { 0.30, 1.0 } } })
hl.curve("fold", { type = "bezier", points = { { 0.70, 0.0 }, { 0.84, 0.0 } } })
hl.curve("rib", { type = "bezier", points = { { 0.22, 1.0 }, { 0.36, 1.0 } } })
hl.curve("spin", { type = "bezier", points = { { 0.37, 0.0 }, { 0.63, 1.0 } } })
hl.curve("paper", {
  type = "spring",
  mass = 1.05,
  stiffness = 180,
  dampening = 22,
})

-- Wine/indigo/forest border rotates like a parasol on its hub.
hl.animation({ leaf = "borderangle", enabled = true, speed = 96, bezier = "spin", style = "loop" })
hl.animation({ leaf = "border", enabled = true, speed = 5.8, bezier = "rib" })
hl.animation({ leaf = "glowangle", enabled = true, speed = 100, bezier = "spin", style = "loop" })
hl.animation({ leaf = "fadeGlow", enabled = true, speed = 4.2, bezier = "unfold" })

-- Windows open from the hub, like a parasol unfolding.
hl.animation({ leaf = "windows", enabled = true, speed = 4.4, spring = "paper" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.6, bezier = "unfold", style = "popin 78%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.0, bezier = "fold", style = "popin 86%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3.4, bezier = "rib" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.2, bezier = "unfold" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.6, bezier = "fold" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "rib" })

hl.animation({ leaf = "layers", enabled = true, speed = 3.2, bezier = "rib" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.6, bezier = "unfold", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.7, bezier = "fold", style = "fade" })

-- Workspaces slide like paper sliding over paper.
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.6, bezier = "unfold", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3.4, bezier = "unfold", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3.0, bezier = "fold", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.4, bezier = "rib", style = "slidevert" })
