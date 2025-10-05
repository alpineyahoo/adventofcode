paste <(awk '{print $1}' input | sort -n) <(awk '{print $2}' input | sort -n) |
awk '{print abs($1 - $2)} function abs(x){return (x>0)? x:-x}' |
awk '{sum+=$1} END{print sum;}'
