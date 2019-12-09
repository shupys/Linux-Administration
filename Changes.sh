#!/bin/bash

OGHash=$"(./Changes.sh)"

hash=sha1sum /var/log* | sha1sum

if[OGHash != hash]
then
echo "There is a change"
fi
