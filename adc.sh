#!/bin/bash

read -p "Dirname (without .ts): " filename

mkdir ${filename} && cd ${filename}

CONSTRAINTS=${filename}.constraints.md
MAIN=${filename}.ts
TEST=${filename}.test.ts
IDEAS=${filename}.ideas.md


touch "${MAIN}" "${TEST}" "${CONSTRAINTS}" "${IDEAS}"

echo -e "# Constraints" > "${CONSTRAINTS}" &&
echo -e "# Ideas" > "${IDEAS}"
