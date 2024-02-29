#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run mypy --ignore-missing-imports add automation/
poetry run isort --check --diff add automation/ tests/
poetry run black --check add automation/ tests/
poetry run flake8 add automation/ tests/
poetry run safety check -i 39462 -i 40291
poetry run bandit -r add automation/
