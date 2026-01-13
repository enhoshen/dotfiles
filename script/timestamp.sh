# I record screenshots of anime I watch with timestamp.
# This script contains functions to post process the recorded
# markdown file and images.

md-png-compress() {
  # under folder with images subfolder, compress png to webp, replace all *png links
  # to *.webp
  #
  # - *.md <-
  # - images <-
  #     |- *.png
  #     |- compressed
  cd images/
  compress png
  mv compressed/*.webp ./
  rm *.png
  cd -
  for i in *.md; do sed -i -e "s/png/webp/" $i; done
}

get-images-from-md() {
  # get image links from markdown file $1
  MD=$(basename $1)
  for i in $(grep -o --regexp="images/.*\.webp" ${MD}); do echo $i; done
}
mv-images-from-md() {
  # $1: path of a markdown file *.md
  # create markdown file folder $1/images
  # then move images found in $1 originally stored
  # under images to $1/images
  NAME=$(basename $1 .md)
  mkdir ${NAME}/images/ -p
  for i in $(get-images-from-md $1); do mv $i ${NAME}/images/; done
  mv $(basename $1) ${NAME}/
}
