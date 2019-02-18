

#If cmus song is playing shows song name, first arg is number of chars to show
#If its paused shows a red stopped



RED='\033[0;31m'
NC='\033[0m' # No Color




if ps ax | grep -v grep | grep cmus > /dev/null
then

	song=`cmus-remote -Q | sed -n 2p | cut -d "/" -f 5 | cut -c1-$1`
	status=`cmus-remote -Q | sed -n 1p | cut -d " " -f 2`

	if [[ $status == "playing" ]]; then
		echo $song
	else
		echo "%{F#880}[*]%{F-}"
	fi
else
	
	echo "%{F#f00}[*]%{F-}"
fi







