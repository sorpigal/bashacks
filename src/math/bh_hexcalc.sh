bh_hexcalc() {
	(( $# < 3 )) && return 1

	printf 0x
	bh_dec2hex $((0x${1#0x} $2 0x${3#0x}))
}
