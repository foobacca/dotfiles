#!/usr/bin/python3

import argparse
import os
import sys
from datetime import date, timedelta
from pathlib import Path
from typing import Iterator, List


def most_recent_file() -> Path:
    return sorted(Path(".").glob("tasks-*.md"))[-1]


def task_path(day: date) -> Path:
    return Path(f"tasks-{day:%Y%m%d}.md")


def find_last_week_files() -> Iterator[Path]:
    for days_ago in range(6):
        file_path = task_path(date.today() - timedelta(days=days_ago))
        if file_path.is_file():
            yield file_path


def file_title(day: date) -> str:
    title = f"{day:%Y %m %d %a}"
    underline = "=" * len(title)
    return f"{title}\n{underline}\n"


def create_new_file(days_ahead: int) -> Path:
    """
    Copy yesterdays file to the new name, replacing the file header
    """
    # TODO: replace calendar with blank calendar (only standups)
    # TODO: consider rewriting 'Done' section as well
    new_day = date.today() + timedelta(days=days_ahead)
    new_file = task_path(new_day)
    old_file_contents = most_recent_file().read_text(encoding="utf8")
    old_file_lines = old_file_contents.split("\n")
    new_file.write_text(file_title(new_day) + "\n".join(old_file_lines[2:]), encoding="utf8")
    return new_file


def exec_nvim(*filenames: Path, read_only: bool = False) -> None:
    """ exec to run the editor, replacing this process """
    argv = ["nvim"]
    if read_only:
        argv.append("-R")
    argv += [str(filename) for filename in filenames]
    argv.append("+Wrap")
    os.execvp("nvim", argv)


def parse_args(argv: List[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(title="command", dest="command", help="command")
    subparsers.add_parser("latest")
    subparsers.add_parser("lastweek")
    create_parser = subparsers.add_parser("create")
    create_parser.add_argument("days", type=int, default=0, help="days into future")
    return parser.parse_args(argv)


def main(argv: List[str]) -> None:
    filename = Path("asdfa")  # TODO: deleteme
    args = parse_args(argv)
    if args.command == "latest":
        filename = most_recent_file()
        exec_nvim(filename)
    elif args.command == "create":
        filename = create_new_file(args.days)
        exec_nvim(filename)
    elif args.command == "lastweek":
        filenames = reversed(list(find_last_week_files()))
        exec_nvim(*filenames, read_only=True)
    else:
        print(f"unknown command {args.command}")
        sys.exit(2)


if __name__ == "__main__":
    main(sys.argv[1:])
