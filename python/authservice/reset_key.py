#!/usr/bin/env python3
import getpass
import os
from keypass_service import authenticate


os.remove(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/priv.czxs"))
os.remove(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/keyette.czxi"))
os.rmdir(str("/home/" + str(getpass.getuser()) + "/.Chameleon/.core"  + "/keys/"))
authenticate()
