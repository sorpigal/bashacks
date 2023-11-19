bh_hex2bin () {
	local n="$1" o
	while ((16#$n>0)); do
		o="$(( 16#$n % 2 ))$o"
		n=$(( 16#$n / 2 ))
		n=$(printf %x "$n")
	done
	printf '%s\n' "$o"
}
