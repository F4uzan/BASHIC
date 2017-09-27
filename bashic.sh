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

# Format of IF is "IF CONDITION-A OPERAND CONDITION-B THEN "COMMAND" END IF"
# Format of IF-ELSE is "IF CONDITION-A OPERAND CONDITION-B THEN "COMMAND" ELSE "COMMAND" END IF"
function IF() {
	condition_a="$1"
	operator="$2"
	condition_b="$3"
	then_if="$4"
	cmd="$(echo $"$5" | sed "s/'/\'/g")"
	is_else="$6"
	
	if [ "$is_else" = "END" ]; then
		if_end="$7"
	elif [ "$is_else" = "ELSE" ]; then
		else_cmd="$(echo $"$7" | sed "s/'/\'/g")"
		is_end="$8"
		if_end="$9"
	fi
	
	case $operator in
		GTR) with=">" ;;
		LSS) with="<" ;;
		EQU) with="=" ;;
		GRQ) with=">=" ;;
		LSQ) with="<=" ;;
		NOT) with="!=" ;;
	esac
	
	if [ "$is_else" = "ELSE" ]; then
		if [ "$condition_a" "$with" "$condition_b" ]; then
			$cmd
		else
			$else_cmd
		fi
	elif [ "$is_else" = "END" ]; then
		if [ "$condition_a" "$with" "$condition_b" ]; then
			$cmd
		fi
	fi
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