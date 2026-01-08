# Contributors
# ---------------------------
# En-Ho Shen <enhoshen@gmail.com>, 2026

from jinja2 import Environment, FileSystemLoader, select_autoescape

env = Environment(loader=FileSystemLoader("./"), autoescape=select_autoescape())
template = env.get_template("letter-keymap.jinja")
icon_a_uni = ord("🅰")
icons = [chr(icon_a_uni + i) for i in range(26)]
a_ascii = ord("a")
keys = ["Key" + chr(a_ascii + i).upper() for i in range(26)]
pairs = zip(icons, keys)
with open("/tmp/out.txt", "w") as file:
    out = template.render(pairs=pairs)
    file.write(out)
