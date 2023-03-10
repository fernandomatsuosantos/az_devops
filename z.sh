
var="DevOps PoC\Q 23.1\Sprint 23.1.3"
count=$(grep -o '\\' <<<"$var" | grep -c .)
echo $count