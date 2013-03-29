import os
import subprocess


# from http://unix.stackexchange.com/questions/44214/encrypt-offlineimap-password
def mailpasswd(acct):
    acct = os.path.basename(acct)
    path = "/home/hamish/.passwd/%s.gpg" % acct
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
