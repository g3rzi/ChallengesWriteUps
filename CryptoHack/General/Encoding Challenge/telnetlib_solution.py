import telnetlib
import json

HOST = "socket.cryptohack.org"
PORT = 13377

tn = telnetlib.Telnet(HOST, PORT)

def readline():
    return tn.read_until(b"\n")

def json_recv():
    line = readline()
    return json.loads(line.decode())

def json_send(hsh):
    request = json.dumps(hsh).encode()
    tn.write(request)

import codecs, base64
def decode(encoding, encoded_string):
    if encoding == "base64":
        base64_bytes = encoded_string.encode('ascii')
        message_bytes = base64.b64decode(base64_bytes)
        decoded = message_bytes.decode('ascii')
    elif encoding == "hex":
        decoded = bytes.fromhex(encoded_string).decode('utf-8')
    elif encoding == "rot13":
        decoded = codecs.decode(encoded_string, 'rot_13')
    elif encoding == "bigint":
        decoded = bytes.fromhex(encoded_string[2:]).decode('utf-8')
    elif encoding == "utf-8":
        decoded = ''.join([chr(i) for i in encoded_string])
    else:
        exit("No encoding type found!")

    return decoded
received = json_recv()
encoding_type = received["type"]
encoding_string = received["encoded"]

for i in range(1,101):
    print("Stage: {0}\n".format(i))
    print("Received type: ")
    print(encoding_type)
    print("Received encoded value: ")
    print(encoding_string)

    decoded = decode(encoding_type, encoding_string)
    to_send = {
        "decoded": decoded
    }

    print("Decoded: ")
    print(decoded)
    json_send(to_send)
    result = json_recv()
    print("Result: {0}".format(result))

    if 'type' not in result:
        break
    encoding_type = result['type']
    encoding_string = result['encoded']

