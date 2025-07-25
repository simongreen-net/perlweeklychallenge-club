#! /usr/bin/lua

-- by Michael Anderson at
-- https://stackoverflow.com/questions/8722620/comparing-two-index-tables-by-index-value-in-lua
-- modified by Roger
function recursive_compare(t1,t2)
  -- Use usual comparison first.
  if t1==t2 then return true end
  -- We only support non-default behavior for tables
  if (type(t1)~="table") then return false end
  -- They better have the same metatables
  local mt1 = getmetatable(t1)
  local mt2 = getmetatable(t2)
  if( not recursive_compare(mt1,mt2) ) then return false end
  -- Build list of all keys
  local kk = {}
  for k1, _ in pairs(t1) do
     kk[k1] = true
  end
  for k2, _ in pairs(t2) do
     kk[k2] = true
  end
  -- Check each key that exists in at least one table
  for _, k in ipairs(kk) do
     if (not recursive_compare(t1[k], t2[k])) then
        return false
     end
  end
  return true
end

function decompressedlist(a)
   local out = {}
   local n = 0
   for _, v in ipairs(a) do
      if n == 0 then
         n = v
      else
         for i = 1, n do
            table.insert(out, v)
         end
         n = 0
      end
   end
   return out
end

if recursive_compare(decompressedlist({1, 3, 2, 4}), {3, 4, 4}) then
  io.write("Pass")
else
  io.write("FAIL")
end
io.write(" ")

if recursive_compare(decompressedlist({1, 1, 2, 2}), {1, 2, 2}) then
  io.write("Pass")
else
  io.write("FAIL")
end
io.write(" ")

if recursive_compare(decompressedlist({3, 1, 3, 2}), {1, 1, 1, 2, 2, 2}) then
  io.write("Pass")
else
  io.write("FAIL")
end
print("")

