#!/bin/bash

BUCKET_NAME=$1
# Remove all trailing slashes from relative href links
find public -name *.html -exec sed -E -i "s/(href=[a-zA-Z/-]+)\/>/\1>/g" {} \;

# Remove trailing slashes from urls in sitemap.xml
sed -E -i 's/<loc>(.*)\/<\/loc>/<loc>\1<\/loc>/g' public/sitemap.xml

# Deploy to S3
aws s3 sync public s3://${BUCKET_NAME} --exclude ".git*"  --acl private --follow-symlinks --delete

files=$(aws s3 ls --recursive ${BUCKET_NAME} | awk '{print $4}' | grep -E .html)

echo "$files"

for f in $files
do
	new_file=""
	case "$f" in
		index.html) 
			echo "found THE index file, ignore"
		;;
		*/index.html)
			new_file=$(echo $f | sed "s/\/index.html//")
			echo "Moving $f to $new_file"
		;;
	esac

	if [[ "$new_file" != "" ]]
	then
		aws s3 mv s3://${BUCKET_NAME}/${f} s3://${BUCKET_NAME}/${new_file} --metadata '{ "Content-Type": "text/html" }'
	fi
	
done
