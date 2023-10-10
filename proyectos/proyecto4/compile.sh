#!/bin/bash

gcc -Wall -Wextra -std=c99 utils.c "$1.c" -o $1
