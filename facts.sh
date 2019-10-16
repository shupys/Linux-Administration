#!/bin/bash

BEGIN{
    FS=":"
}
{
	/Savage/{print $1,$2}
}
BEGIN{
	FS=":"
}
{
	/Chet/{print $3,$4,$5}
}
BEGIN{
	FS=":"
}
{
if( $3>250 )
then
	print $0
}

