for i in {1..50} ; do
  alias d$i="d$i="'`pwd`' # dx: set dx=`current dir`
  alias d${i}-="d$i="''   # dxx-: clear dxx
  alias cd$i='cd $d'$i    # cdx: cd to $dx
done

function d() {
  for i in {1..30} ; do
     x=d$i
     y=${!x}
     if [ ! -z $y ] ; then
       echo $i:`basename $y` : `echo $y | sed -e s@$HOME@'~'@`
     fi
  done
}

function dsave() {
  case $# in
    0)suffix="" ;;
    *)suffix="$1" ;;
  esac
  if [ ! -d ~/.d ] ; then
    mkdir ~/.d
  fi
  for i in {1..30} ; do
    x=d$i
    y=${!x}
    if [ ! -z $y ] ; then
      echo 'd'$i'="'$y'"'
    fi
  done >| ~/.d/d${suffix}.txt
}

function dload() {
    case $# in
      0)suffix="" ;;
      *)suffix="$1" ;;
    esac
    f=~/.d/d${suffix}.txt
    g=`grep -v '^d[0-9]*="[^"]*" *$' $f`
    if [ ! -z "$g" ] ; then
      echo "Bad lines in $f:"
      echo $g
      return
    fi
    . $f
}
