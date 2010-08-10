
local cairo = require 'cairo'

fg_default = 0x000000
bg_default = 0xffffff

fg_default_alpha = 0.75
bg_default_alpha = 0.5

graphs = {}

function Ring (s)
  ensure_settings(s)
  assert(s.radius, "radius required")
  s.thickness = s.thickness or s.width or 5
  s.start_angle = s.start_angle or 0
  s.end_angle = s.end_angle or 360
  table.insert(graphs, function (cr)
    local value = get_conky_value(s.name, s.arg)
    local perc = percent(value, s.min, s.max)
    draw_ring(cr, perc, s.x, s.y, s.radius, s.thickness,
            s.fg_color, s.fg_alpha, s.bg_color, s.bg_alpha,
            s.start_angle, s.end_angle)
  end)
end

function Bar (s)

end

function Pie (s)

end

function ensure_settings (s)
  assert(s.name, "name required")
  assert(s.x, "x required")
  assert(s.y, "y required")
  s.arg = s.arg or s.args or ""
  s.max = s.max or 100
  s.min = s.min or 0
  s.fg_color = s.fb_color or s.fg_colour or fg_default
  s.bg_color = s.bg_color or s.bg_colour or bg_default
  s.fg_alpha = s.fg_alpha or fg_alpha_default
  s.bg_alpha = s.bg_alpha or bg_alpha_default
end

function get_conky_value (name, arg)
  local str = string.format("${%s %s}", name, arg)
  return tonumber(str) or 0
end

function percent(value, min, max)
  return (value - min) / (max - min)
end

function rgb(colour,alpha)
  return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function deg2rad(deg)
 return deg * (2 * math.pi / 360)
end

local iters = 0
function conky_run ()
  if conky_window == nil then return end
  local cs=cairo.xlib_surface_create(conky_window.display,
          conky_window.drawable, conky_window.visual, 
          conky_window.width, conky_window.height)
  local cr=cairo.create(cs)

  if iters < 5 then 
    iters = tonumber(conky_parse('${updates}')) 
  else
    for _, draw_func in ipairs(graphs) do
      draw_func(cr)
    end
  end
end

-- Drawing functions

function draw_ring(cr, per, x, y, rad, w, fgc, fga, bgc, bga, sa, ea)

  -- convert to radians and rotate to top
  local angle_0 = deg2rad(s.start_angle) - math.pi/2
  local angle_f = deg2rad(s.end_angle) - math.pi/2
  local t_arc = per * (angle_f - angle_0)

  local arc_func = ea > sa and cairo_arc or cairo_arc_negative
  -- Draw background ring
  arc_func(cr, s.x, s.y, s.radius, angle_0, angle_f)
  cairo_set_source_rgba(cr, rgb(bgc, bga))
  cairo_set_line_width(cr, w)
  cairo_stroke(cr)

  -- Draw indicator ring
  arc_func(cr, x, y, rad, angle_0, angle_0+t_arc)
  cairo_set_source_rgba(cr, rgb(fgc, fga))
  cairo_stroke(cr)
end

function draw_bar (cr, per)

end

function draw_pie (cr, per)

end

-- Utility shapes for decoration

function draw_rect (cr)

end

function draw_round_rect (cr)

end

function draw_circle (cr)

end

