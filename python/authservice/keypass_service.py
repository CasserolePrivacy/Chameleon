#!/usr/bin/env python3
import os
import getpass
from cryptography.fernet import Fernet

def get_user_keys_dir():
    """Returns the directory path where user's keys are stored."""
    return os.path.join("/home", getpass.getuser(), ".Chameleon", ".core", "keys")

def authenticate():
    keys_dir = get_user_keys_dir()
    priv_key_path = os.path.join(keys_dir, "priv.czxs")
    keyette_path = os.path.join(keys_dir, "keyette.czxi")
    
    if os.path.exists(priv_key_path):
        with open(priv_key_path, "rb") as key, open(keyette_path, "rb") as keyette:
            chamkey = Fernet(key.read())
            encrypted_syskey = keyette.read()
        passkeydat = chamkey.decrypt(encrypted_syskey)
        return passkeydat

    else:
        os.makedirs(keys_dir, exist_ok=True)
        key = Fernet.generate_key()
        chamkey = Fernet(key)
        passkey = os.getenv("key") if os.getenv("key") != "null" else getpass.getpass(prompt="Enter a key for Chameleon Cryptography Service: \n")
        token = chamkey.encrypt(passkey.encode('utf8'))
        with open(priv_key_path, "wb") as privkey, open(keyette_path, "wb") as keyfile:
            privkey.write(key)
            keyfile.write(token)
        exit(code=1)
