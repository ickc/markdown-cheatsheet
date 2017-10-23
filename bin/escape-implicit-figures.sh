#!/usr/bin/env bash

# pandoc only: escape implicit_figures
sed -i \
	-e 's/!\[\([^]]*\)\](\([^)]*\))[\]\?[ ]*$/!\[\1\](\2)\\ /' \
	-e 's/!\[\([^]]*\)\](\([^)]*\)){\([^}]*\)}[\]\?[ ]*$/!\[\1\](\2){\3}\\ /' \
	"$@"
