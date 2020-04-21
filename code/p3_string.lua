x = "a"
print(x)
x = x .. "bcd"
print(x)
--Takes a substring, but the end index is inclusive
--Starts indexing at 1, which makes me sad
print(x:sub(2,3))