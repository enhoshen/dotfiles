md-png-compress() {
  # under images folder, compress png to webp, replace all *png links
  # to *.webp
  #
  # - *.md
  # - images <-
  #     |- *.png
  #     |- compressed
  compress png
  mv compressed/*.webp ./
  rm *.png
  for i in ../*.md; do sed -i -e "s/png/webp/" $i; done
}

get-images-from-md() {
  # get image links from markdown file $1
  MD=$(basename $1)
  for i in $(grep -o --regexp="images/.*\.webp" ${MD}); do echo $i; done
}
mv-images-from-md() {
  # create markdown file folder $1/images
  # then move images found in $1 originally stored
  # under images to $1/images
  MD=$(basename $1)
  mkdir ${MD}/images/ -p
  for i in $(get-images-from-md $1); do mv $i ${MD}/images/; done
  mv ${MD}.md ${MD}/
}
