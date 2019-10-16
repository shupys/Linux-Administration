#!/bin/bash

echo "Which directory would you like to search?"

read directory

find $directory -perm /4000
