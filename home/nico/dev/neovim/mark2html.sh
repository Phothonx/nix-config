#!/usr/bin/env bash
# Vimwiki mark2html using Pandoc
set -e

force="$1"
# syntax="$2" # unused
extension="$3"
output_dir="$4"
input_file="$5"
css_file="$6"
template_path="$7"
template_default="$8"
template_ext="$9"
root_path="${10}"
custom_args="${11}"

base_name="$(basename "$input_file" ".$extension")"
output_file="$output_dir/$base_name.html"

if [ -f "$output_file" ] && [ "$force" != "1" ]; then
  exit 0
fi

mkdir -p "$output_dir"

lua_filter="$(mktemp)"
cat > "$lua_filter" <<'EOF'
function Link(el)
  if el.target:match("%.md$") then
    el.target = el.target:gsub("%.md$", ".html")
  end
  return el
end
EOF
trap 'rm -f "$lua_filter"' EXIT

pandoc_opts=(
  "--from=markdown"
  "--to=html5"
  "--standalone"
  "--metadata=pagetitle:$base_name"
  "--lua-filter=$lua_filter"
)

if [ "$css_file" != "-" ] && [ -f "$css_file" ]; then
  pandoc_opts+=("--css=$css_file")
fi

if [ "$template_path" != "-" ] && [ "$template_default" != "-" ]; then
  template_file="$template_path/$template_default.$template_ext"
  if [ -f "$template_file" ]; then
    pandoc_opts+=("--template=$template_file")
  fi
fi

if [ "$root_path" != "-" ]; then
  pandoc_opts+=("--metadata=root_path:$root_path")
fi

if [ "$custom_args" != "-" ]; then
  # shellcheck disable=SC2206
  pandoc_opts+=($custom_args)
fi

pandoc "${pandoc_opts[@]}" "$input_file" -o "$output_file"
