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
from keypass_service import authenticate


class ChameleonPy():
        
    def __init__(self):
        global pathdir
        global passfile
        global keyfile
        global passkey
        global runner
        runner = getpass.getuser()

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
pass_service = authenticate()

vaughnlib = VaughnPy()
runner = vaughnlib.runner()

passkeydat = pass_service
localrunner = runner

validsession = Chameleon.init_askforpasscode(passkeydat)

            
            




