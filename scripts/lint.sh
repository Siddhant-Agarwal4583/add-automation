#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run safety check -i 39462 -i 40291
poetry run bandit -c pyproject.toml -r {{cookiecutter.project_name}}/
poetry run isort --check --diff {{cookiecutter.project_name}}/ tests/
poetry run black --check {{cookiecutter.project_name}}/ tests/
poetry run flake8 {{cookiecutter.project_name}}/ tests/
poetry run mypy \
           --install-types \
           --non-interactive \
           {{cookiecutter.project_name}}/
#  https://mypy.readthedocs.io/en/stable/running_mypy.html#library-stubs-not-installed