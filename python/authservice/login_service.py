#!/usr/bin/env python3
import os
import getpass
import __main__
from cryptography.fernet import Fernet
from keypass_service import authenticate



def promptpasscode(passkeydat):
    inputpass = getpass.getpass(prompt="Enter your Chameleon Passkey: \n").encode('utf8')
    return inputpass == passkeydat

def isvalidsession(validsession,runner):
    if  validsession and runner:
        return True

def loginuserdaemon(isvalidsession):
    if not isvalidsession:
        print(f"Error: Unable to authenticate with current passkey and user.")
    else:
        print(f"Logged in sucessfully as {getpass.getuser()}.")
