with open(r'C:\tmp\flare2020\4\hex_T.txt', 'r') as f:
    lines_t = f.read()

with open(r'C:\tmp\flare2020\4\hex_L.txt', 'r') as f:
    lines_l = f.read()


def mid(s, offset, amount):
    return s[offset:offset+amount]

def rigmarole(es):
    furphy = ''

    for i in range(0, len(es), 4):
        c = int(mid(es, i, 2), 16)
        s = int(mid(es, i+2, 2), 16)
        cc = c - s
        furphy = furphy + chr(cc)

    return furphy


def canoodle(panjandrum, ardylo, s, bibble):
    kerfuffle = [None]*s
    quean = 0
    for cattywampus in range(0, len(panjandrum), 4):
        a = int(mid(panjandrum, cattywampus + ardylo, 2), 16)
        b = bibble[quean % (len(bibble))]

        result = a ^ b
        kerfuffle[quean] = result
        quean += 1
        if quean == len(kerfuffle):
            break

    return kerfuffle

onzo = lines_l.split(".")
fudgel = rigmarole(onzo[7])

rigmarole_8 = rigmarole(onzo[8])
rigmarole_9 = rigmarole(onzo[9])



xertz = [0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE]
mp3 = canoodle(lines_t, 0, 168667, xertz)


#with open(r'C:\tmp\flare2020\4\stomp2.mp3', 'wb') as f:
#    f.write(bytes(mp3))

rigmarole_0 = rigmarole(onzo[0])
rigmarole_1 = rigmarole(onzo[1])
b = 3

for i in range(len(onzo)):
    print("onzo[%s]: %s" % (i, rigmarole(onzo[i])))


# ASC function returns the ASCII value of a character or the first character in a string
buff = [None]*8
for i in range(0,8):
    buff[7-i] = ord(mid('FLARE-ON',i,1))


png = canoodle(lines_t, 2, 0x45C21, buff)
with open(r'C:\tmp\flare2020\4\flag.png', 'wb') as f:
    f.write(bytes(png))



