bh_str2hex() {
	(( $# < 1 )) && return 1

	case $1 in
		-x)
			printf %s "$2" | hexdump -ve '/1 "%02x"' | sed 's/../\\x&/g'
			printf '\n'
		;;
		-0x)
			printf %s "$2" | hexdump -ve '/1 "0x%02x "' | sed 's/\(.*\) /\1/'
			printf '\n'
		;;
		-c)
			printf '{ '
			printf %s "$2" | hexdump -ve '/1 "0x%02x, "' | sed 's/\(.*\), /\1/'
			printf ' }\n'
		;;
		*)
			printf %s "$1" | hexdump -ve '/1 "%02x "' | sed 's/\(.*\) /\1/'
			printf '\n'
		;;
	esac
}
