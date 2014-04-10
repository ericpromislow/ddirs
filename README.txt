Maintain a set of shortcuts to directories in each shell.  Save different
sets of shortcuts across shell sessions, or share sets across separate
sessions.

In your .bashrc/.profile/.whatever file:

. ~/.ddirs

Usage:

d*n* (where *n* is between 1 and 50, configurable max)
- sets d*n* to the current directory

cd*n* - cd to $d*n*

d - dump the current set of shortcuts

dsave [name] - save the current set of shortcuts (with an optional name)

dload [name] - load a set of shortcuts, either the default global or the named set

FILES

Shortcuts are saved in ~/.d/d*.txt
