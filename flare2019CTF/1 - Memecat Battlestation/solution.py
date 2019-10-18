# Stage 1: RAINBOW

# Stage 2
myarray = ['\u0003',' ','&','$','-','\u001e','\u0002',' ', '/','/','.', '/']				
				
flag = ''
for i in myarray:
   flag += chr(ord(i) ^ ord('A'))

print(flag)
