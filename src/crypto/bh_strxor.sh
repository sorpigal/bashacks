bh_strxor() {
	(( $# < 2 )) && return 1

	local str i xorged

	# $2 is the string and $1 is the xor key
	IFS=' ' read -ra str < <(bh_str2dec "$2")

	for i in "${str[@]}"; do
		xored=$(( $i ^ $1 ))
		printf %s "$(bh_dec2asc "$xored")"
	done
	printf '\n'
}
