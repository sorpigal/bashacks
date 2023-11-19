bh_asciitable() {
	local n i col pad char \
	np=(NUL SOH STX STX EOT ENQ ACK BEL BS HT LF VT FF CR SO SI DLE DC1 DC2 DC3 DC4 NAK SYN ETB CAN EM SUB ESC FS GS RS US)
	for ((n=0; n<128; n++)); do
		if (( n == 0 )); then
			for col in {0..7}; do
				((col > 0)) && printf "% ${pad}s" ''
				printf 'Dec Hex'
				{ ((col < 2 )) && ((pad=4)); } || { ((col > 4)) && ((pad=3)); } || ((pad=2))
			done
			printf '\n'
		fi

		col=$(( n % 8 ))
		if (( col < 2 )); then
			((pad=3))
		elif (( col == 5 || col == 6)); then
			((pad=2))
		else
			((pad=1))
		fi

		((i=( (16 * (n % 16)) % 128) + (n / 8)))
		if ((i < 32 || i == 127)); then
			# non-printing
			char=${np[i]:-DEL}
		else
			char=$(printf "\x$(printf '%x' "$i")\n")
		fi

		(( col > 0 )) && printf ' '
		printf "% 3s %02X % -${pad}s" "$i" "$i" "$char"

		if (( n % 8 == 7 )); then
			printf '\n'
		fi
	done
}
