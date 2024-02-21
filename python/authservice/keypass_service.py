#!/usr/bin/env python3
import os
import getpass
import __main__
from cryptography.fernet import Fernet

def authenticate():
    if os.path.exists(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/priv.czxs")):
        with open(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/priv.czxs"), "rb") as key:
            chamkey = Fernet(key.read())
        with open(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/keyette.czxi"), "rb") as keyette:
            encrypted_syskey = keyette.read()
        passkeydat = chamkey.decrypt(encrypted_syskey)
        return passkeydat

    else:
        os.makedirs(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/"))
        key = Fernet.generate_key()
        chamkey = Fernet(key)
        passkey = str(getpass.getpass(prompt="Enter a key for Chameleon Cryptography Service: \n"))
        token = chamkey.encrypt(passkey.encode('utf8'))
        with open(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core" + "/keys/priv.czxs"), "wb") as privkey:
            privkey.write(key)
        with open(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core" + "/keys/keyette.czxi"), "wb") as keyfile:
            keyfile.write(token)
        exit(code=1)
