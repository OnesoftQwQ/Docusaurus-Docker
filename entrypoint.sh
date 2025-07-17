#!/bin/sh
if [ ! -f "/docusaurus/package.json" ]; then
  rm -rf /docusaurus/*
  cp -r /docusaurus-files/* /docusaurus
fi
cd /docusaurus
exec pnpm start
