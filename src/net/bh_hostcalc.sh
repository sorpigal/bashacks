bh_hostcalc() {
	(( $# < 1 )) && return 1

	printf %s\\n $((2**(32-$1) - 2))
}
