Have to run 

`uv sync`

followed by

`uv pip install "unsloth[flashattention] @ git+https://github.com/unslothai/unsloth.git" --no-build-isolation`

because pyproject doesn't allow for the `--no-build-isolation` flag