import os
import subprocess


# from http://unix.stackexchange.com/questions/44214/encrypt-offlineimap-password
def mailpasswd(acct):
    acct = os.path.basename(acct)
    path = "/home/hamish/.passwd/%s.gpg" % acct
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    proc = subprocess.Popen(args, stdout=subprocess.PIPE)
    output = proc.communicate()[0].strip()
    retcode = proc.wait()
    if retcode == 0:
        return output
    else:
        return ''
