bh_md5rename() {
	(( $# < 1 )) && return 1

	local i md5_hash
	for i; do
		IFS=' ' read -r md5_hash _ < <(bh_cmd_md5 "$i")
		[[ -n $md5_hash ]] && mv "$i" "$(dirname "$i")/$md5_hash"
	done
}
