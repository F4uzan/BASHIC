#!/bin/bash
# BASHIC, a Simple and Horribly-coded Instruction Code
# Version 0.0.1-Git

# This is a Shell framework that runs .BAF

function PRINT() {
	echo "$@"
}

function REM() {
	return 0
}

function END() {
	exit
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
	if [ "$#" = 2 ]; then
		add_text=true
		text="$1"
		variable="$2"
	elif [ "$#" = 1 ]; then
		variable="$1"
	fi
	if [ "$add_text" = "true" ]; then
		printf "%s " "$text"
	else
		printf "? "
	fi
	read -r "$variable"
}

function TRON() {
	echo "* $@"
	"$@"
}

# Format of FOR is "FOR NUMBER-A TO NUMBER-B "COMMAND" NEXT"
function FOR() {
	var="$1"
	to="$2"
	condition="$3"
	cmd="$(echo $"$4" | sed "s/'/\'/g")"
	next="$5"
	
	while [ "$var" -le "$condition" ]; do
		var=$(($var+1))
		$cmd
	done
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