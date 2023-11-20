bh_rot () {
	local i chr ord rot="$1" s o
	shift
	for s; do
		for ((i=0; i < ${#s}; i++)); do
			chr="${s:i:1}"
			printf -v ord %d \'"$chr"

			o=
			((ord>64)) && o=0
			((ord>90)) && o=
			((ord>96)) && o=32
			((ord>122)) && o=
			[[ -z $o ]] && { printf %s "$chr"; continue; }

			((ord=65+o+((ord-(65+o)+rot)%26)))
			printf '\x'"$(printf %x "$ord")"
		done
		printf '\n'
	done
}
