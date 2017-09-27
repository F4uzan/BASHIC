#!/bin/bash
# BASHIC, a small (horrible) instructed code
# Version 0.0.1-Git

# This is a Shell framework that runs .BAF

function PRINT() {
	echo "$1"
}

function REM() {
	printf ""
}

function END() {
	printf ""
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