horizon = {}

function horizon.load(arg)
  horizon.mode_reset()
  for i = 1,horizon.max_lines do
    horizon.newline()
  end
  horizon.lines = {}
  for i = 1,horizon.max_lines do
    local line = {}
    for i = 1,horizon.max_points+1 do
      table.insert(line,math.random(1,horizon.max_point))
    end
    table.insert(horizon.lines,1,line)
  end
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

horizon.push_dt = 0
horizon.push_cycle = 1/60
horizon.max_point = 32
function horizon.update(dt)
  horizon.push_dt = horizon.push_dt + dt
  if horizon.push_dt >= horizon.push_cycle then
    horizon.push_dt = horizon.push_dt - horizon.push_cycle
    horizon.newline()
  end
end

horizon.lines = {}
horizon.max_points = 8
horizon.max_lines = 128
function horizon.newline()
  local line = {}
  for i = 1,horizon.max_points+1 do
--    table.insert(line,math.random(1,horizon.max_point))
    table.insert(line,math.abs(math.cos(i*math.pi/10))*math.random(1,horizon.max_point)+math.random(1,4))
  end
  if #horizon.lines >= horizon.max_lines then
    table.remove(horizon.lines,#horizon.lines)
  end
  table.insert(horizon.lines,1,line)
end

horizon.layer_callbacks = {}
function horizon.add_layer_callback(f)
  table.insert(horizon.layer_callbacks,f)
end

function horizon.layer_color_callback(line_index,max_lines)
  love.graphics.setColor(0,255*(line_index/max_lines),0,255)
end
