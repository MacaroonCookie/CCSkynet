graph_module = { }

local Graph = {
  nodes = {}
}

function graph_module.new()
  new = {}
  setmetatable(new, Graph)
  return new
end

function Graph._array_has_value(arr, value)
  for i=1,#arr do
    if arr[i] == value then
      return true
    end
  end
  return false
end

function Graph:create(object)
  new_node = {
    _obj = object,
    _edges = {}
  }
  self.nodes[object] = new_node
  return true
end

function Graph:remove(object)
  if self.nodes[object] ~= nil then
    self.nodes[object] = nil
    return true
  end
  return false
end

function Graph:has(object)
  if self.nodes[object] ~= nil then
    return true
  end
  return false
end

function Graph:areConncted(object1, object2)
  for i=1, #self.nodes[object1].edges do
    if self.nodes[object1].edges[i] == object2 then
      for j=1, #self.nodes[object2].edges do
        if self.nodes[object2].edges[j] == object1 then
          return true
        else
          break
        end
      end
    end
  end

  return false
end

function Graph:connect(object1, object2)
  if self.nodes[object1] == nil || self.nodes[object2] == nil then
    return false
  end

  if self._array_has_value(self.nodes[object1].edges, object2) == nil then
    table.insert(self.nodes[object1].edges, object2)
  end
  if self._array_has_value(self.nodes[object2].edges, object1) == nil then
    table.insert(self.nodes[object2].edges, object1)
  end
  return true
end

function Graph:disconnect(object1, object2)
  if self.nodes[object1] == nil || self.nodes[object2] == nil then
    return false
  end

  for i=1,#self.nodes[object1].edges do
    if table.nodes[object1].edges[i] == object2 then
      table.remove(self.nodes[object1].edges, i)
    end
  end
  for i=1,#self.nodes[object2].edges do
    if table.nodes[object2].edges[i] == object1 then
      table.remove(self.nodes[object2].edges, i)
    end
  end
end

return graph_module
