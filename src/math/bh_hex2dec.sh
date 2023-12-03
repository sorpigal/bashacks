bh_hex2dec() {
	(( $# )) || return 1

	printf '%s\n' "$(( 16#${1#0x} ))"
}
