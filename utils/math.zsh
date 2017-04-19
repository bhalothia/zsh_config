alias sum=$'awk \'{ sum += $1 } END { print sum }\''

alias avg=$'awk \'{ sum += $1; count+=1 } END { print sum / count }\''

alias min=$'awk \'!init { init = 1; min = $1 } { min = ($1 < min ? $1 : min) } END { print min }\''

alias max=$'awk \'!init { init = 1; max = $1 } { max = ($1 > max ? $1 : max) } END { print max }\''

alias math=$'awk \'
!init { init = 1;
  min = $1 
  max = $1
}
{ 
  cnt +=1;
  sum += $1; 
  min = ($1 < min ? $1 : min);
  max = ($1 < max ? $1 : max);
} END { 
  print "cnt: " cnt; 
  print "sum: " sum; 
  print "min: " min; 
  print "max: " max; 
  print "avg: " (cnt ? sum / cnt : null); 
}\''