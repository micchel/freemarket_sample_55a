json.array! @children do |child|
  json.id child.id
  json.name child.name
end

json.array! @grand_children do |grand_child|
  json.id grand_child.id
  json.name grand_child.name
end