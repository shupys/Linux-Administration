#!/bin/bash

sed -i '1 i/PERSONNEL FILE' datebook

sed -e '/500$/d' datebook


sed -n -e 's/\(^[A-Za-z]*\)\([ \t]*\)\(A-Za-z]*\):\(.*\)$/\3\2\1:\4/g'

sed -e '$a\THE END'


