#!/bin/bash

cd /mnt/c/Users/Moritz/Documents/Test
COUNTER=0
loop()

loop () {
	if [[$COUNTER == 10]]; then exit; fi;

	BACK=[[$($RANDOM) % 2]]

	if [[$BACK == 0]] && [[$(pwd) == C:\Users\Moritz\Documents\Test]]; then loop(); else cont(); fi;
}

cont () {
	if [[$BACK == 0]]; then cd ..; fi;
	if [[$BACK == 1]]; then check(); fi;
	loop()
}

check () {
	ls | grep "*" && (call :random) || (call :create)
}

random () {
GO=[[$($RANDOM) % 4]]
if [[$GO == 0]]; cd rechts
if [[$GO == 1]]; cd links
if [[$GO == 2]]; cd oben
if [[$GO == 3]]; cd unten
loop ()
}

create () {
COUNTER=[[$COUNTER + 1]]
mkdir rechts
mkdir links
mkdir oben
mkdir unten
loop ()
}
