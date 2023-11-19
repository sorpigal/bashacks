
bh_ip2bin() {
	[[ "$1" =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] || return 1
	local ip i
	IFS=. read -ra ip <<<"$1"
	for ((i=0; i<${#ip[@]}; i++)); do
		ip[i]=$(printf '%08d' "$(bh_dec2bin "${ip[i]}")")
	done
	(IFS='.'; printf '%s\n' "${ip[*]}")
}
