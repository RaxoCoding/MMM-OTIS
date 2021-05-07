export TERM=xterm-256color
clear

if [ `uname` == Linux ]; then
    ls $PREFIX/lib/libtinfow.so
fi


set -ex



test -f ${PREFIX}/lib/libncurses.a
test -f ${PREFIX}/lib/libncursesw.a
test -f ${PREFIX}/lib/libncurses.dylib
test -f ${PREFIX}/lib/libncursesw.dylib
test -f ${PREFIX}/lib/libtinfo.a
test -f ${PREFIX}/lib/libtinfow.a
test -f ${PREFIX}/lib/libtinfo.dylib
test -f ${PREFIX}/lib/libtinfow.dylib
test -f ${PREFIX}/lib/libform.a
test -f ${PREFIX}/lib/libformw.a
test -f ${PREFIX}/lib/libform.dylib
test -f ${PREFIX}/lib/libformw.dylib
test -f ${PREFIX}/lib/libmenu.a
test -f ${PREFIX}/lib/libmenuw.a
test -f ${PREFIX}/lib/libmenu.dylib
test -f ${PREFIX}/lib/libmenuw.dylib
test -f ${PREFIX}/lib/libpanel.a
test -f ${PREFIX}/lib/libpanelw.a
test -f ${PREFIX}/lib/libpanel.dylib
test -f ${PREFIX}/lib/libpanelw.dylib
test -d ${PREFIX}/include/ncurses
test -d ${PREFIX}/include/ncursesw
test -L ${PREFIX}/include/ncurses/curses.h
test -L ${PREFIX}/include/ncursesw/curses.h
test -f ${PREFIX}/include/curses.h
test -L ${PREFIX}/include/ncurses/cursesapp.h
test -L ${PREFIX}/include/ncursesw/cursesapp.h
test -f ${PREFIX}/include/cursesapp.h
test -L ${PREFIX}/include/ncurses/cursesf.h
test -L ${PREFIX}/include/ncursesw/cursesf.h
test -f ${PREFIX}/include/cursesf.h
test -L ${PREFIX}/include/ncurses/cursesm.h
test -L ${PREFIX}/include/ncursesw/cursesm.h
test -f ${PREFIX}/include/cursesm.h
test -L ${PREFIX}/include/ncurses/cursesp.h
test -L ${PREFIX}/include/ncursesw/cursesp.h
test -f ${PREFIX}/include/cursesp.h
test -L ${PREFIX}/include/ncurses/cursesw.h
test -L ${PREFIX}/include/ncursesw/cursesw.h
test -f ${PREFIX}/include/cursesw.h
test -L ${PREFIX}/include/ncurses/cursslk.h
test -L ${PREFIX}/include/ncursesw/cursslk.h
test -f ${PREFIX}/include/cursslk.h
test -L ${PREFIX}/include/ncurses/eti.h
test -L ${PREFIX}/include/ncursesw/eti.h
test -f ${PREFIX}/include/eti.h
test -L ${PREFIX}/include/ncurses/etip.h
test -L ${PREFIX}/include/ncursesw/etip.h
test -f ${PREFIX}/include/etip.h
test -L ${PREFIX}/include/ncurses/form.h
test -L ${PREFIX}/include/ncursesw/form.h
test -f ${PREFIX}/include/form.h
test -L ${PREFIX}/include/ncurses/menu.h
test -L ${PREFIX}/include/ncursesw/menu.h
test -f ${PREFIX}/include/menu.h
test -L ${PREFIX}/include/ncurses/nc_tparm.h
test -L ${PREFIX}/include/ncursesw/nc_tparm.h
test -f ${PREFIX}/include/nc_tparm.h
test -L ${PREFIX}/include/ncurses/ncurses.h
test -L ${PREFIX}/include/ncursesw/ncurses.h
test -f ${PREFIX}/include/ncurses.h
test -L ${PREFIX}/include/ncurses/ncurses_dll.h
test -L ${PREFIX}/include/ncursesw/ncurses_dll.h
test -f ${PREFIX}/include/ncurses_dll.h
test -L ${PREFIX}/include/ncurses/panel.h
test -L ${PREFIX}/include/ncursesw/panel.h
test -f ${PREFIX}/include/panel.h
test -L ${PREFIX}/include/ncurses/term.h
test -L ${PREFIX}/include/ncursesw/term.h
test -f ${PREFIX}/include/term.h
test -L ${PREFIX}/include/ncurses/term_entry.h
test -L ${PREFIX}/include/ncursesw/term_entry.h
test -f ${PREFIX}/include/term_entry.h
test -L ${PREFIX}/include/ncurses/termcap.h
test -L ${PREFIX}/include/ncursesw/termcap.h
test -f ${PREFIX}/include/termcap.h
test -L ${PREFIX}/include/ncurses/tic.h
test -L ${PREFIX}/include/ncursesw/tic.h
test -f ${PREFIX}/include/tic.h
test -L ${PREFIX}/include/ncurses/unctrl.h
test -L ${PREFIX}/include/ncursesw/unctrl.h
test -f ${PREFIX}/include/unctrl.h
test -f ${PREFIX}/lib/pkgconfig/form.pc
test -f ${PREFIX}/lib/pkgconfig/formw.pc
test -f ${PREFIX}/lib/pkgconfig/menu.pc
test -f ${PREFIX}/lib/pkgconfig/menuw.pc
test -f ${PREFIX}/lib/pkgconfig/ncurses++.pc
test -f ${PREFIX}/lib/pkgconfig/ncurses++w.pc
test -f ${PREFIX}/lib/pkgconfig/ncurses.pc
test -f ${PREFIX}/lib/pkgconfig/ncursesw.pc
test -f ${PREFIX}/lib/pkgconfig/panel.pc
test -f ${PREFIX}/lib/pkgconfig/panelw.pc
test -f ${PREFIX}/lib/pkgconfig/tinfo.pc
test -f ${PREFIX}/lib/pkgconfig/tinfow.pc
exit 0
