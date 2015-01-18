# UAE4All for Raspberry Pi Makefile

###############################################
#  Set these vars to setup cross compiling 
###############################################
#CROSS_COMPILE = arm-linux-gnueabihf-
#STAGING_DIR = /opt/rpi-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/
#SYSROOT = /opt/raspbian

PREFIX = /usr/local
SDL_BASE = ${SYSROOT}${PREFIX}/bin/

NAME   = uae4all
O      = o
RM     = rm -f
CC     = ${STAGING_DIR}${CROSS_COMPILE}gcc
CXX    = ${STAGING_DIR}${CROSS_COMPILE}g++
STRIP  = ${STAGING_DIR}${CROSS_COMPILE}strip

PROG   = $(NAME)

all: $(PROG)

DEFAULT_CFLAGS = `$(SDL_BASE)sdl-config --prefix=${SYSROOT}$(PREFIX) --cflags`
LDFLAGS = -L${SYSROOT}/opt/vc/lib -lbcm_host -lvcos -lvchiq_arm -lSDL_image -lz -lpng -lpthread `$(SDL_BASE)sdl-config --prefix=${SYSROOT}$(PREFIX) --libs` -lguichan_sdl -lguichan -lSDL_ttf
MORE_CFLAGS += -DGP2X -DPANDORA -DRASPBERRY -DDOUBLEBUFFER -DUSE_SDLSOUND --sysroot=${SYSROOT}
MORE_CFLAGS += -I${SYSROOT}/opt/vc/include -I${SYSROOT}/opt/vc/include/interface/vmcs_host/linux -I${SYSROOT}/opt/vc/include/interface/vcos/pthreads
MORE_CFLAGS += -Isrc -Isrc/gp2x -Isrc/menu -Isrc/include -Isrc/gp2x/menu -Wno-unused -Wno-format -DUSE_SDL -DGCCCONSTFUNC="__attribute__((const))" -DUSE_UNDERSCORE -DUNALIGNED_PROFITABLE -DOPTIMIZED_FLAGS -DSHM_SUPPORT_LINKS=0 -DOS_WITHOUT_MEMORY_MANAGEMENT
MORE_CFLAGS += -DUSE_GUICHAN -fexceptions -DUSE_EMULATED_JOYSTICK
MORE_CFLAGS += -DROM_PATH_PREFIX=\"./\" -DDATA_PREFIX=\"./data/\" -DSAVE_PREFIX=\"./saves/\"
MORE_CFLAGS += -march=armv6zk -mcpu=arm1176jzf-s -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard -ffast-math
MORE_CFLAGS += -DUSE_FAME_CORE -DUSE_AUTOCONFIG -DUSE_ZFILE -DSAFE_MEMORY_ACCESS

ifndef DEBUG
MORE_CFLAGS += -O2 -mstructure-size-boundary=32 -falign-functions=32 -finline-functions -fno-builtin
else
MORE_CFLAGS += -ggdb
endif

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS)
CPPFLAGS = $(CFLAGS)

OBJS =	\
	src/audio.o \
	src/autoconf.o \
	src/blitfunc.o \
	src/blittable.o \
	src/blitter.o \
	src/cfgfile.o \
	src/cia.o \
	src/savedisk.o \
	src/savestate.o \
	src/custom.o \
	src/disk.o \
	src/drawing.o \
	src/ersatz.o \
	src/expansion.o \
	src/filesys.o \
	src/fsdb.o \
	src/fsdb_unix.o \
	src/fsusage.o \
	src/gfxutil.o \
	src/hardfile.o \
	src/keybuf.o \
	src/main.o \
	src/memory.o \
	src/missing.o \
	src/native2amiga.o \
	src/gui.o \
	src/od-joy.o \
	src/scsi-none.o \
	src/sound_sdl_new.o \
	src/sdlgfx.o \
	src/writelog.o \
	src/zfile.o \
	src/menu/fade.o \
	src/gp2x/memcpy.o \
	src/gp2x/memset.o \
	src/gp2x/gp2x.o \
	src/gp2x/inputmode.o \
	src/gp2x/menu/menu_helper.o \
	src/gp2x/menu/menu_config.o \
	src/gp2x/menu/menu.o \
	src/menu_guichan/menu_guichan.o \
	src/menu_guichan/menuTabMain.o \
	src/menu_guichan/menuTabFloppy.o \
	src/menu_guichan/menuTabHD.o \
	src/menu_guichan/menuTabDisplaySound.o \
	src/menu_guichan/menuTabSavestates.o \
	src/menu_guichan/menuTabControl.o \
	src/menu_guichan/menuTabCustomCtrl.o \
	src/menu_guichan/menuMessage.o \
	src/menu_guichan/menuLoad_guichan.o \
	src/menu_guichan/menuConfigManager.o \
	src/menu_guichan/uaeradiobutton.o \
	src/menu_guichan/uaedropdown.o \
	src/m68k/fame/famec.o \
	src/m68k/fame/m68k_intrf.o \
	src/m68k/m68k_cmn_intrf.o

$(PROG): $(OBJS) 
	$(CXX) $(CFLAGS) -o $(PROG) $(OBJS) $(LDFLAGS)
ifndef DEBUG
	$(STRIP) $(PROG)
endif

clean:
	$(RM) $(PROG) $(OBJS)

