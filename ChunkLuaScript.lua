local file_name = arg[1] or "test.lua"
os.execute("luac53 " .. file_name)
os.execute("lua53 ChunkSpy/ChunkSpy53.lua luac.out " .. file_name .. " --brief -o chunk.lst")
os.remove("luac.out")