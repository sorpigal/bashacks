bh_dec2asc() {
	for c; do
		printf '\x'"$(printf %x "$c")"'\n'
	done
}
