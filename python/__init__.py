#!/usr/bin/env python3
import threading
import subprocess
import getpass
import os
import platform
import random, string
import datetime
import requests
import sys
from cryptography.fernet import Fernet


class ChameleonPy():
        
    def __init__(self):
        global pathdir
        global passfile
        global keyfile
        global passkey
        global runner
        runner = getpass.getuser()

    def keypass_service(self):
          if os.path.exists(str("/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/priv.czxs")):
               with open(str("/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/priv.czxs"), "rb") as key:
                    chamkey = Fernet(key.read())
               with open(str("/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/keyette.czxi"), "rb") as keyette:
                    encrypted_syskey = keyette.read()
               passkeydat = chamkey.decrypt(encrypted_syskey)
               return passkeydat

          else:
             os.makedirs(str("/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/"))
             key = Fernet.generate_key()
             chamkey = Fernet(key)
             passkey = str(getpass.getpass(prompt="Enter a key for Chameleon Cryptography Service: \n"))
             token = chamkey.encrypt(passkey.encode('utf8'))
             with open(str("/" + str(getpass.getuser()) + "/.Chameleon/.core" + "/keys/priv.czxs"), "wb") as privkey:
                 privkey.write(key)
             with open(str("/" + str(getpass.getuser()) + "/.Chameleon/.core" + "/keys/keyette.czxi"), "wb") as keyfile:
                 keyfile.write(token)
             exit(code=1)
    def init_askforpasscode(self,passkeydat):
        inputpass = str(getpass.getpass(prompt="Enter your Chameleon Passkey: \n")).encode('utf8')
        if inputpass == passkeydat:
            validsession = True
            return validsession
        else:
            validsession = False
            return validsession



     
class VaughnPy(ChameleonPy):
    def runner(self,runner=getpass.getuser()):
          if runner:
             validRunner = True
          else:
             validRunner = False
         
          if validRunner:
            runner = [str("exec: " + str(self)),str("runner: " + runner)]
            return runner


Chameleon = ChameleonPy()            
pass_service = Chameleon.keypass_service()

vaughnlib = VaughnPy()
runner = vaughnlib.runner()

passkeydat = pass_service
localrunner = runner

validsession = Chameleon.init_askforpasscode(passkeydat)

            
            




