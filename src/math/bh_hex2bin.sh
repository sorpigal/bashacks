bh_hex2bin () {
	local n o l=()
	for n; do
		o=
		while ((16#$n > 0)); do
			o="$(( 16#$n % 2 ))$o"
			n=$(( 16#$n / 2 ))
			n=$(printf %x "$n")
		done
		l+=("$o")
	done
	printf '%s\n' "${l[*]}"
}
