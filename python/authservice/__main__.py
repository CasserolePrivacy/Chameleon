#!/usr/bin/env python3
import subprocess
import getpass
from keypass_service import authenticate
from login_service import promptpasscode
from login_service import isvalidsession
from login_service import loginuserdaemon


class ChameleonPy():

    def __init__(self):
        global pathdir
        global passfile
        global keyfile
        global passkey
        global runner
        runner = getpass.getuser()

class VaughnPy(ChameleonPy):
    def runner(self,runner):
          if runner:
             validRunner = True
          else:
             validRunner = False

          if validRunner:
            runner = [str("exec: " + str(self)),str(" runner: " + runner)]
            return runner


Chameleon = ChameleonPy()
passkeydat = authenticate()
runner = VaughnPy().runner(runner=getpass.getuser())
localrunner = runner
validsession = promptpasscode(passkeydat)
userisloggedintodaemon = loginuserdaemon(isvalidsession=isvalidsession(validsession,runner))






