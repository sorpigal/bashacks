bh_hashes() {
	(( $# < 1 )) && return 1

	local i words
	for i; do
		IFS=' ' read -ra words < (
			bh_cmd_md5 "$i"
			bh_cmd_sha1 "$i"
			bh_cmd_sha256 "$i"
		)
		printf '%s\n' "$words[@]"
	done
}
