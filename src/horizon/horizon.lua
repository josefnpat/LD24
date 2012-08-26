horizon = {}

function horizon.load(arg)
  horizon.max_lines = 128
  horizon.max_point = 8
  horizon.max_points = 8
  horizon.lines = {}
  for i = 1,horizon.max_lines do
    local line = horizon.genline()
    table.insert(horizon.lines,1,line)
  end
  horizon.push_dt = 0
  horizon.mode_reset()
  horizon.pretty_dt = 0
  horizon.max_point_trend = 0
end

function horizon.mode_reset()
  horizon.hspacer = love.graphics.getWidth()/horizon.max_points
  horizon.vspacer = love.graphics.getHeight()/horizon.max_lines
  horizon.gui_yoffset = -horizon.max_point*horizon.vspacer
end

horizon.screen_scale = 1.125
function horizon.draw()
  for line_index,line in ipairs(horizon.lines) do
    local prev = 0
    local yoffset = ((horizon.max_lines-(line_index))*horizon.vspacer)/horizon.screen_scale+horizon.gui_yoffset
    horizon.layer_color_callback(line_index,horizon.max_lines)
    for point_index,point in ipairs(line) do
      love.graphics.polygon("fill",
        (point_index-2)*horizon.hspacer,
        love.graphics.getHeight()-yoffset,
        (point_index-2)*horizon.hspacer,
        love.graphics.getHeight()-yoffset-prev*horizon.vspacer,
        (point_index-1)*horizon.hspacer,
        love.graphics.getHeight()-yoffset-point*horizon.vspacer,
        (point_index-1)*horizon.hspacer,
        love.graphics.getHeight()-yoffset
      )
      prev = point
    end
    for _,callback in ipairs(horizon.layer_callbacks) do
      callback(line_index,yoffset)
    end
    love.graphics.setColor(255,255,255,255)
  end
end

function horizon.update(dt)
  horizon.push_dt = horizon.push_dt + dt
  local cycle = 1/(15*player.char.spd)
  if horizon.push_dt >= cycle then
    horizon.push_dt = horizon.push_dt - cycle
    horizon.newline()
  end
  horizon.pretty_dt = horizon.pretty_dt + dt
  horizon.max_point = horizon.max_point + math.random(-1,1)/4 + horizon.max_point_trend
  if horizon.max_point < 8 then
    horizon.max_point = 8
    horizon.max_point_trend = 0.5
  end
  if horizon.max_point > 56 then
    horizon.max_point = 56
    horizon.max_point_trend = -0.25
  end
end

function horizon.newline()
  local line = horizon.genline()
  if #horizon.lines >= horizon.max_lines then
    table.remove(horizon.lines,#horizon.lines)
  end
  table.insert(horizon.lines,1,line)
end

function horizon.genline()
  local line = {}
  for i = 1,horizon.max_points+1 do
--    table.insert(line,math.random(1,horizon.max_point)) --Random
    table.insert(line,math.abs(math.cos(i*math.pi/10))*math.random(1,horizon.max_point)+math.random(1,4)) --Cos Random
  end
  return line
end

horizon.layer_callbacks = {}
function horizon.add_layer_callback(f)
  table.insert(horizon.layer_callbacks,f)
end

hor_debug_r_min = 0
hor_debug_r_max = 255

hor_debug_g_min = 0
hor_debug_g_max = 255

hor_debug_b_min = 0
hor_debug_b_max = 255


function horizon.layer_color_callback(line_index,max_lines)
  if enemy.wave[enemy.cwave] and enemy.wave[enemy.cwave].setColor then
    enemy.wave[enemy.cwave].setColor(line_index,max_lines)
  else
    if debug.enabled then
      love.graphics.setColor(math.random(hor_debug_r_min,hor_debug_r_max),math.random(hor_debug_g_min,hor_debug_g_max),math.random(hor_debug_b_min,hor_debug_b_max))
    else
      love.graphics.setColor(math.random(128,192),math.random(128,192),0,255*(line_index/max_lines))
      --love.graphics.setColor(0,255*(line_index/max_lines),0,255)--old
    end
  end
end
