#!/bin/bash

echo $* | tr " " "\n" | sort -R | tr "\n" " " && echo
