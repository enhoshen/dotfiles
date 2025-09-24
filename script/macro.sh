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
