#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD$
#

# PROVIDE: lightdm
# REQUIRE: DAEMON LOGIN wscons
# KEYWORD: shutdown

$_rc_subr_loaded . /etc/rc.subr

name="lightdm"
rcvar=$name
command="@PREFIX@/sbin/${name}"

load_rc_config $name
run_rc_command "$1"
