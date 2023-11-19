bh_dec2bin () {
	local n="$1" o
	while ((n>0)); do
		o="$(( n % 2 ))$o"
		(( n /= 2 ))
	done
	printf '%s\n' "$o"
}
