bh_str2hex () {
	(( $# )) || return 1

	local i c o h l m s

	while (( $# )); do
		case $1 in
			-x)
				m=x
			;;
			-0x)
				m=0x
			;;
			-c)
				m=c
			;;
			*)
				l=()
				for ((i=0;i<${#1};i++)); do
					c=${1:i:1}
					printf -v o %d "${c/#/\'}"
					printf -v h %x "$o"
					l+=("$h")
				done

				case $m in
					x)
						printf '\\x%s' "${l[@]}"
						printf '\n'
					;;
					0x)
						l=("${l[@]/#/0x}")
						printf '%s\n' "${l[*]}"
					;;
					c)
						l=("${l[@]/#/0x}")
						printf -v s ', %s' "${l[@]}"
						printf '{ %s }\n' "${s:2}"
					;;
					*)
						printf '%s\n' "${l[*]}"
					;;
				esac
			;;
		esac
		shift
	done
}
