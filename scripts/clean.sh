#!/bin/bash
set -euxo pipefail

poetry run isort add automation/ tests/
poetry run black add automation/ tests/
