--[[

Ring Meters by londonali1010 (2009)
 
This script draws percentage meters as rings. It is fully customisable; all
options are described in the script.
 
IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation
fault if it tries to draw a ring straight away. The if statement on line 145
uses a delay to make sure that this doesn't happen. It calculates the length of
the delay by the number of updates since Conky started. Generally, a value
of 5s is long enough, so if you update Conky every 1s, use update_num > 5 in
that if statement (the default). If you only update Conky every 2s, you
should change it to update_num > 3; conversely if you update Conky every 0.5s,
you should use update_num > 10. ALSO, if you change your Conky, is it best
to use "killall conky; conky" to update it, otherwise the update_num will
not be reset and you will get an error.
 
To call this script in Conky, use the following (assuming that you save this
script to ~/scripts/rings.lua):
  lua_load ~/scripts/rings-v1.2.1.lua
  lua_draw_hook_pre ring_stats
 
Changelog:
+ v1.2.1 -- Fixed minor bug that caused script to crash if conky_parse() returns a nil value (20.10.2009)
+ v1.2 -- Added option for the ending angle of the rings (07.10.2009)
+ v1.1 -- Added options for the starting angle of the rings, and added the "max" variable, to allow for variables that output a numerical value rather than a percentage (29.09.2009)
+ v1.0 -- Original release (28.09.2009)

]]

--[[
-- Ring Options:
-- name = conky variable name
-- arg = conky args as string
-- max = largest number for ring
-- bg_colour, bg_alpha
-- fg_colour, fg_alpha = color stuff
-- x, y = location of ring center (relative to conky top left)
-- radius = ring radius
-- thickness = thickness of ring
-- start_angle, end_angle = angles, in degrees, pos or neg
--]]

Ring {
  name="cpu",
  arg="cpu1",
  bg_colour=0xffffff,
  fg_colour=0xff0000,
  x=50, y=50,
  radius=30,
  thickness=8,
  start_angle=150,
  end_angle=30,
}

Ring {
  name="cpu",
  arg="cpu2",
  max=100,
  bg_colour=0xffffff,
  bg_alpha=0.5,
  fg_colour=0xff0000,
  fg_alpha=0.75,
  x=50, y=50,
  radius=30,
  thickness=8,
  start_angle=-150,
  end_angle=-30,
}

Ring {
  name="freq_g",
  arg="cpu1",
  max=2.1, min=1.0,
  bg_colour=0xffffff,
  bg_alpha=0.5,
  fg_colour=0x0000ff,
  fg_alpha=0.75,
  x=50, y=50,
  radius=25,
  thickness=2,
  start_angle=-150,
  end_angle=-30
}

Ring {
  name="freq_g",
  arg="cpu2",
  max=2.1, min=1.0,
  bg_colour=0xffffff,
  bg_alpha=0.5,
  fg_colour=0x0000ff,
  fg_alpha=0.75,
  x=50, y=50,
  radius=25,
  thickness=2,
  start_angle=150,
  end_angle=30
}

Ring {
  name="memperc",
  arg="",
  max=100,
  bg_colour=0xffffff,
  bg_alpha=0.5,
  fg_colour=0x0000ff,
  fg_alpha=0.75,
  x=50, y=150,
  radius=50,
  thickness=8,
  start_angle=150,
  end_angle=30
}

Ring {
  name="swapperc",
  arg="",
  max=100,
  bg_colour=0xffffff,
  bg_alpha=0.5,
  fg_colour=0x0000ff,
  fg_alpha=0.75,
  x=50, y=150,
  radius=58,
  thickness=8,
  start_angle=150,
  end_angle=30
}

