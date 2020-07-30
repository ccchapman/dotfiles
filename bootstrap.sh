#!/bin/bash
rsync --exclude '.git/' \
  --exclude '.DS_Store' \
  --exclude 'README.md' \
  --exclude 'bootstrap.sh' \
  -avh --no-perms . ~;
