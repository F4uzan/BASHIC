#!/bin/bash
# BASHIC, a small (horrible) instructed code
# Version 0.0.1-Git

# This is a Shell framework that runs .BAF

function PRINT() {
	echo "$@"
}

function REM() {
	printf ""
}

function END() {
	printf ""
}

function CLS() {
	clear
}

function SLEEP() {
	time="$1"
	sleep "$time"
}

function WAIT() {
	time="$1"
	SLEEP "$time"
}

function INPUT() {
	variable="$1"
	printf "? "
	read -r "$variable"
}

# Format of LET is "LET VARIABLE = 'NUMBERS'"
function LET() {
	variable_name="$1"
	just_equate="$2"
	actual_number="$3"
	
	export "$variable_name=$(($actual_number))"
}

# Format of SET is "SET VARIABLE = 'VALUE'"
function SET() {
	variable_name="$1"
	just_equate="$2"
	actual_value="$3"
	
	export "$variable_name=$actual_value"
}