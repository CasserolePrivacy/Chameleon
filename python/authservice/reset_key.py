#!/usr/bin/env python3
import getpass
import os
import sys
from cryptography.fernet import Fernet
from keypass_service import authenticate
import __main__

os.remove(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/priv.czxs"))
os.remove(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/keyette.czxi"))
os.rmdir(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/"))
pass_service = authenticate()
