bh_hex2str() {
	local c i
	for c; do
		# strings may start with literal 0x or \x
		c=${c#0x}
		c=${c#'\x'}
		c=${c##* }

		for ((i=0; i<${#c}; i+=2)); do
			printf "\\x${c:i:2}"
		done

		printf '\n'
	done
}
