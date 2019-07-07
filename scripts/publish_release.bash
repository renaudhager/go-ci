#!/usr/bin/env bash
set -e

echo "Creating release ${DRONE_TAG}"
gothub release \
   --repo ${DRONE_REPO_NAME} \
   --tag ${DRONE_TAG}
echo "Release created."

echo "Publishing assets to ${DRONE_TAG} release..."
for bin in `ls dist`
do
  echo "Uploading ${bin} ...."
  gothub upload \
    --repo ${DRONE_REPO_NAME} \
    --tag ${DRONE_TAG} \
    --name "${bin}" \
    --file dist/${bin}
    echo "${bin} has been uploaded."
done
