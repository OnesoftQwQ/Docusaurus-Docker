#!/bin/sh
if [ ! -f "/docusaurus/docusaurus.exist" ]; then
  rm -rf /docusaurus/*
  cp -r /docusaurus-files/* /docusaurus
  touch /docusaurus/docusaurus.exist
fi
cd /docusaurus
exec pnpm start
