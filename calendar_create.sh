
name=$1
loc=$2
t0=$3
tf=$4

#20201008T040000Z%2F20201008T050000Z"

opera "https://www.google.com/calendar/render?action=TEMPLATE&text=$name&location=$loc&dates=%2F$tf"

