bh_str2dec() {
	local i c ord
	while (( $# )); do
		ord=()
		for ((i=0;i<${#1};i++)); do
			c=${1:i:1}
			ord+=($(printf '%d\n' "${c/#/\'}"))
		done
		printf '%s\n' "${ord[*]}"
		shift
	done
}
