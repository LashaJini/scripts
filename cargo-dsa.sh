#!/bin/bash

echo "$@" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g'
