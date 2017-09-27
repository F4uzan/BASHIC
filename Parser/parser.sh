#!/bin/bash
# BASHIC, a Simple and Horribly-coded Instruction Code
# Version 0.0.1-Git

# This is the parser for BASC
# Used when BASC doesn't import BASHIC's source file

# BASHIC's source file must be in the same directory as the parser

function bashic() {
	file="$1"
	
	if [ ! -f "$file" ]; then
		echo "File not found: $file"
		return
	fi
	
	bash -c "source bashic.sh; . ./$file"
}

