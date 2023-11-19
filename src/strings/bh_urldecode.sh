bh_urldecode () {
	local url_encoded
	for url_encoded; do
		url_encoded="${url_encoded//+/ }"
		printf %b "${url_encoded//%/\\x}"
	done
}
