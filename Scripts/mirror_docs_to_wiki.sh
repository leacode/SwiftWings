#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WIKI_DIR="${REPO_ROOT}/.wiki"
WIKI_REMOTE="https://github.com/leacode/SwiftWings.wiki.git"

if [ ! -d "${WIKI_DIR}/.git" ]; then
  echo "Cloning wiki repository into ${WIKI_DIR}" >&2
  git clone "${WIKI_REMOTE}" "${WIKI_DIR}"
else
  echo "Updating existing wiki clone" >&2
  (cd "${WIKI_DIR}" && git pull --ff-only)
fi

rsync -a --delete "${REPO_ROOT}/Docs/" "${WIKI_DIR}/"

cat <<MSG
Docs copied into ".wiki". Review and push with:
  cd ${WIKI_DIR}
  git status
  git add .
  git commit -m "Sync docs"
  git push
MSG
