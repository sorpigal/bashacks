bh_secretfile(){
	(( $# < 1 )) && return 1
	local pw filename
	IFS= read -r -n20 pw < <(tr -dc 'a-zA-Z0-91_#@.-' < /dev/urandom)
	filename=$RANDOM.zip
	zip -P "$pw" "$filename" "$1"
	bh_sharefile "$filename"
	printf '%s\n' "$pw"
	rm -f "$filename"
}
