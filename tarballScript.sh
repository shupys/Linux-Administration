
#!/bin/bash

echo "Path to directory to archive"

read archive1

echo "New archive name"

read archive2

tar -zcvf $archive2 $archive1
