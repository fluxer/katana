#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#

# PROVIDE: kdm
# REQUIRE: DAEMON LOGIN wscons
# KEYWORD: shutdown

$_rc_subr_loaded . /etc/rc.subr

name="kdm"
rcvar=$name
command="@PREFIX@/bin/${name}"

load_rc_config $name
run_rc_command "$1"
