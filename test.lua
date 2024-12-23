print("lua begin")
t = {1, 2, 3, 4, 5, 6, 7, 8}
-- array size: 8 --> {1,2,3,4,5,6,7,8}
-- hash size: 0

t.a = 1
t.b = 1
t.c = 1
t.d = 1
t.e = 1
-- array size: 8 --> {1,2,3,4,5,6,7,8}
-- hash size: 5 --> {1,1,1,1,1}

t.a = nil
t.b = nil
t.c = nil
t.d = nil
t.e = nil
-- hash部分把空间腾出来，可以使得后续插入的整数键值对分散到hash部分。
-- array size: 8 --> {1,2,3,4,5,6,7,8}
-- hash size: 5 --> {nil,nil,nil,nil,nil}

t[9] = 9
-- {9，9} 插入到了hash部分
-- array size: 8 --> {1,2,3,4,5,6,7,8}
-- hash size: 5 --> {9,nil,nil,nil,nil}
t[12] = 12
-- {12, 12} 插入到了hash部分
-- array size: 8
-- hash size: 5 --> {9,12,nil,nil,nil}

print(#t) --> 12
-- 在luaH_getn函数中，发现array部分已满，因此检查了一下hash部分的array size+1的值，发现存在值9，因此进入hashsearch函数开始二分。
-- 8和16的中间是12，检查12后发现其值存在，在12与16之间进行二分，得到结果边界为12
print("lua end")