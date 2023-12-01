bh_str2dec() {
	(( $# < 1 )) && return 1

	local i c ord=()
	for ((i=0;i<${#1};i++)); do
		c=${1:i:1}
		ord+=($(printf '%d\n' "${c/#/\'}"))
	done
	printf '%s\n' "${ord[*]}"
}
