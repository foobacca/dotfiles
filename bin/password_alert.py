#!/usr/bin/python3

import os
import re
import subprocess
from datetime import datetime


PASSWORD_LAST_SET = "passwordLastSetTime"
LIMIT_DAYS = 85
WARN_DAYS = 75


NOTIFY_CMD = """
on run argv
  display notification (item 2 of argv) with title (item 1 of argv)
end run
"""


def notify(title: str, text: str) -> None:
    subprocess.call(['osascript', '-e', NOTIFY_CMD, title, text])


def find_line_with_time(output: str) -> str:
    lines = output.split("\n")
    for index, line in enumerate(lines):
        if PASSWORD_LAST_SET in line:
            return lines[index + 1]
    raise Exception(f"Could not find line containing '{PASSWORD_LAST_SET}' in output:\n{output}")


def convert_last_time_to_dt(line: str) -> datetime:
    match = re.search(r"\d+", line)
    if not match:
        raise Exception(f"Could not find unix timestamp in line: {line}")
    unix_time = int(match.group(0))
    return datetime.fromtimestamp(unix_time)


def get_last_password_change() -> datetime:
    home = os.environ["HOME"]
    result = subprocess.run(["dscl", ".", "read", home], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=True)
    output = result.stdout.decode("utf8")
    last_time_line = find_line_with_time(output)
    return convert_last_time_to_dt(last_time_line)


def main():
    last_change = get_last_password_change()
    now = datetime.now()
    change_days_ago = (now - last_change).days
    days_left = LIMIT_DAYS - change_days_ago
    if days_left <= WARN_DAYS:
        notify(
            "Password change due",
            f"You have {days_left} days left to change your password!"
        )


if __name__ == "__main__":
    main()
