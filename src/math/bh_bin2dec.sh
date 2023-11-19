bh_bin2dec() {
	(( $# < 1 )) && return 1
	printf %s\\n $((2#$1))
}
