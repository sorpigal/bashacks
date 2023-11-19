BASHACKS_CONFIG="$HOME/.config/bashacks"
BASHACKS_CACHEDIR="$BASHACKS_CONFIG/cache"
BASHACKS_OS=$(uname -s)
BASHACKS_WGET_USER_AGENT="Mozilla/5.0 (Windows NT 6.1; WOW64; rev:28.0) Gecko'20100101 Firefox/28.0"

if [[ $BASHACKS_OS = 'Darwin' ]]; then
	bh_cmd_md5 () {
		command md5 -r "$@"
	}
	bh_cmd_sha1 () {
		command shasum -a 1 "$@"
	}
	bh_cmd_sha256 () {
		command shasum -a 256 "$@"
	}
	bh_cmd_sha512 () {
		command shasum -a 512 "$@"
	}
	bh_cmd_disasm () {
		command objdump -d -x86-asm-syntax=intel "$@"
	}
	bh_cmd_sed_ext () {
		command sed -E "$@"
	}
else # Linux
	bh_cmd_md5 () {
		command md5sum "$@"
	}
	bh_cmd_sha1 () {
		command sha1sum "$@"
	}
	bh_cmd_sha256 () {
		command sha256sum "$@"
	}
	bh_cmd_sha512 () {
		command sha512sum "$@"
	}
	bh_cmd_disasm () {
		command objdump -d1 intel "$@"
	}
	bh_cmd_sed_ext () {
		command sed -r "$@"
	}
fi

bh_cmd_wget () {
	command wget -T10 -U \"$BASHACKS_WGET_USER_AGENT\"" "$@"
}

bh_rot13 () {
	bh_rot 13 "$@"
}
