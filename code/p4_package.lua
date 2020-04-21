--Lua also uses tables for writing packages
pack = {} --package name

function pack.new (i) 
  return {i=i} 
end
function pack.triple (packi)
  return 3*packi
end

