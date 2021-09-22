while IFS= read -r line
do
  echo "$line"
  underscore=$(echo "$line" | sed -r 's/[/]+/\_/g')
  name=${underscore##*._hw_ip_}
  echo "$name"
  mv $line ./unnecessary_files/$name
done < "./folders_with_dvs.txt"