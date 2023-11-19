bh_hex2str() {
	(( $# )) || return 1

	local c i
	for c; do
		# unwrap enclosing braces
		c=${c#'{'}
		c=${c%'}'}

		# strip any space or comma delimiters
		c=${c//[ ,]/}

		# strings may start with literal 0x or \x
		c=${c//0x/}
		c=${c//'\x'}

		for ((i=0; i<${#c}; i+=2)); do
			printf "\\x${c:i:2}"
		done

		printf '\n'
	done
}
