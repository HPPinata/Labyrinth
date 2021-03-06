#!/bin/bash

function main {
	cd /tree
	COUNTER=0
	loop
}

function loop {
	if (( $COUNTER == 22 )); then copy; fi;
	(( BACK = $RANDOM % 2 ))
	if [[ $(pwd) == /tree ]]; then BACK=0; fi;
	cont
}

function cont {
	if (( $BACK == 0 )); then check; fi;
	if (( $BACK == 1 )); then cd ..; fi;
	loop
}

function check {
	[ "$(ls -Ap | grep /)" ] && random || create
	loop
}

function random {
	(( GO = $RANDOM % 4))
	if (( $GO == 0 )); then cd rechts; fi
	if (( $GO == 1 )); then cd links; fi
	if (( $GO == 2 )); then cd oben; fi
	if (( $GO == 3 )); then cd unten; fi
}

function create {
	(( COUNTER = $COUNTER + 1 ))
	mkdir rechts
	mkdir links
	mkdir oben
	mkdir unten
}

function copy {
	random
	touch link
	exit
}

main
