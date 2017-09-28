#!/bin/bash
# BASHIC, a Simple and Horribly-coded Instruction Code
# Version 0.0.2-Git

# BASHIC Framework, contains all functions used by BASHIC
# Cannot be used to directly run BASC file, use parser for that

function PRINT() {
	echo "$@"
}

function π() {
	echo "3.14159265359"
}

function PI() {
	echo "3.14159265359"
}

function SQR() {
	echo "sqrt($1)" | bc -l
}

function LOG() {
	echo "l($1)" | bc -l
}

function SIN() {
	echo "s($1)" | bc -l
}

function COS() {
	echo "c($1)" | bc -l
}

function TAN() {
	echo "s($1)/c($1)" | bc -l
}

function ATN() {
	echo "a($1)" | bc -l
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

function TIME() {
	date +%H%M%S
}

function TI() {
	TIME
}

function STOP() {
	msg="$1"
	if [ "$msg" = "" ]; then
		read -rsn1 -p "STOP. Press any key to continue."; echo
	else
		read -rsn1 -p "$msg"; echo
	fi
}

function RND() {
	rand="$1"
	if [ "$rand" = 0 ]; then
		echo "$RANDOM"
	else
		echo "$((RANDOM % $rand))"
	fi
}

function RANDOMIZE() {
	type="$1"
	case $type in
		PR_ID) seed="(echo $$)" ;;
		DATE) seed="$(date +%s)" ;;
		NANO) seed="$(date +%N)" ;;
		TIMER) seed="$(date +%H%M%S)" ;;
		*) seed="$1" ;;
	esac
	RANDOM="$seed"
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

# Format of FOR is "FOR NUMBER-A TO NUMBER-B "COMMAND""
function FOR() {
	var="$1"
	to="$2"
	condition="$3"

	a_var="$var"
	a_cond="$condition"	
	shift 3

	cmd="$(echo $@ | sed "s/'/\'/g")"

	while [ "$a_var" -le "$a_cond" ]; do
		a_var=$(($a_var+1))
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