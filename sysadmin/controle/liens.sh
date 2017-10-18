#!/bin/bash

test $# -lt 2 && echo "Operation impossible" && exit 1

for f in $(find $2 -type f -printf '%n %p\n' 2>/dev/null | grep '^[2-9] *' | cut -d " " -f 2);do
	echo "$f $(stat $f -c%i)" >> $1
done
