#!bash
#Sed Learning
#'
#file="this-is-a-{test}file"
#sed 's/{[^}]*}//' <<< "$file"
#'

#Tr Learning
file="this-is-a:testfile"
echo $file | tr ":" "\n"
