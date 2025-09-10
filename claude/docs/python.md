## Python

- I prefer to use `uv` for everything (`uv add`, `uv run`, etc)
- Do not use old fashioned methods for package management like poetry, pip or easy_install.
- Make sure that there is a `pyproject.toml` file in the project root directory.
- If there isn't a `pyproject.toml` file, create one using `uv` by running `uv init`.
- As far as possible, generate code that lines up with the "black" code style. In particular, prefer double quotes over single quotes for strings.
- NEVER edit the `uv.lock` file directly - all changes to it should be done by the `uv` commands.
- I tend to have a `justfile` in the repo and have `just test` run all the tests and `just check` run linters and type checking. Use them both before making a commit.
- Where possible, put all imports at the top of the file. Only import at runtime where it is necessary.
