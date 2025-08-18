#!/usr/bin/env bash
set -euo pipefail

# Usage: ./update_submodule.sh [branch]
# Default branch is "main"

SUBMODULE_PATH="instructor_update"
BRANCH="${1:-main}"

echo "Syncing submodules…"
git submodule sync

echo "Updating '$SUBMODULE_PATH' to latest on '$BRANCH'…"
git submodule update --init --remote "$SUBMODULE_PATH"

echo "Staging .gitmodules…"
git add .gitmodules || true

echo "Committing (if needed)…"
git commit -m "Configure ${SUBMODULE_PATH} submodule to track ${BRANCH} branch" || echo "No changes to commit."

echo "Pushing…"
git push

echo "Done."
