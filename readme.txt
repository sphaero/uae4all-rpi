 _________________________________________
(                                         )
(  - UAE4All 2.5.3.2  for Raspberry Pi -  )
(                                         )
 -----------------------------------------
          o
           o
            o          __---__
                    _-       /--______
               __--( /     \ )XXXXXXXXXXX\v.
             .-XXX(   O   O  )XXXXXXXXXXXXXXX-
            /XXX(       U     )        XXXXXXX\
          /XXXXX(              )--_  XXXXXXXXXXX\
         /XXXXX/ (      O     )   XXXXXX   \XXXXX\
         XXXXX/   /            XXXXXX   \__ \XXXXX
         XXXXXX__/          XXXXXX         \__---->
 ---___  XXX__/          XXXXXX      \__         /
   \-  --__/   ___/\  XXXXXX            /  ___--/=
    \-\    ___/    XXXXXX              '--- XXXXXX
       \-\/XXX\ XXXXXX                      /XXXXX
         \XXXXXXXXX   \                    /XXXXX/
          \XXXXXX      >                 _/XXXXX/
            \XXXXX--__/              __-- XXXX/
             -XXXXXXXX---------------  XXXXXX-
                \XXXXXXXXXXXXXXXXXXXXXXXXXX/
                  ""VXXXXXXXXXXXXXXXXXXV""


this version is built from latest pandora sources.
vanfanel's dispmanx accelerated libsdl is included
for rpi's videocore4 hardware scaling on the linux console.
updated guichan libs included now too.

what's new:
- misc fixes
- new blitter modes

see repo.openpandora.org/?page=detail&app=uae4all
for a complete changelog.


installation:
1. unpack uae4all

2. install needed library packages.
   at least you need to:
   "sudo aptitude install 
   libsdl1.2debian libsdl-image1.2 libsdl-ttf2.0-0"

   dependend on your current raspbian setup there
   is good chance you need to install some more
   packages.

3. next add "@pi - rtprio 90" to file
   "/etc/security/limits.conf"
   this will allow to run the emu with higher realtime
   priority, so background programs can't introduce
   nasty stuttering.

4. put a kick12.rom/kick13.rom/kick20.rom/kick31.rom into
   the "kickstarts" folder.
   an aros kickrom is supplied by default.

5. switch to linux console
   and "cd /somedir/uae4all", 
   finally launch with "./amiga".


if it doesn't start up right away, you need to install
some more libs via "sudo aptitude install packagename".


on my pi model b with cpu running at 900mhz and a 
crt-tv at 50hz via composite out, the result for a500 is
supersmooth most of the time, wooohooo! :)

a1200 is not fullspeed here yet, but maybe one can better
this with a higher cpu overclock of the pi and/or
future uae4all optimizations.


as this is an early version, here are some issues i found:
- if mousemovement makes gui crashy, use directional
  keys and tab to navigate.
- don't change drivespeed from 1x or sound will stutter
  while loading. 1x loads as fast as 8x here.
- custom config doesn't work, controls are hardcoded to:

in gui:
- "esc" resets/loads a disk
- "ctrl" switches to game
- "directional keys/tab/enter" navigate gui

in game:
- "ctrl" switches back to gui
- "alt" toggles input (joystick/mouse/stylus?)
- "directional keys" for movement
- "home/end/pgup/pgdown" for fire-buttons etc.


huge thanks to all the devs!
Chui, john4p, TomB, notaz, Bernd Schneider,
Toni Wilen, Pickle, smoku, AnotherGuest,
Anonymous engineer, finkel, Lubomyr, pelya,
amiga1200gamer and all the unsung heros.


links:
www.raspberrypi.org/forums/viewtopic.php?f=78&t=80602
boards.openpandora.org/topic/15387-repo-uae4all-2510
eab.abime.net/showthread.php?t=73953


enjoy your shiny new amiga-on-a-pi!


amiga-oldskool-love!
rSl
:)


