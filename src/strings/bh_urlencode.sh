bh_urlencode () {
	local component length LANG=C i c
	for component; do
		length="${#component}"
		for (( i = 0; i < length; i++ )); do
			c="${component:i:1}"
			case "$c" in
				["'"a-zA-Z0-9'_.!~*()-']) printf %s "$c" ;;
				*) printf %%%02X "'$c" ;;
			esac
		done
	done
}
