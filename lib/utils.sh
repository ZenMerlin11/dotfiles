#!/bin/bash
# Common utilities


update_package_index() {
  echo "Updating apt package index..."
  apt-get update -y
}


upgrade_packages() {
  update_package_index && \
  echo "Upgrading packages..." && \
  apt-get upgrade -y
}


install() {
  program_name="$1"

  if not_installed "$program_name"; then
    echo "Installing ${program_name}..."
    apt-get install -y "${program_name}"
  else
    echo "${program_name} already installed. Skipping..."
  fi
}


is_installed() {
  program_name="$1"
  
  dpkg -s "$program_name" &> /dev/null
  in_pkg_man=$?

  command -v "$program_name" &> /dev/null
  in_path=$?

  if [[ in_pkg_man -eq 0 ]] || [[ in_path -eq 0 ]]; then
    return 0
  else
    return 1
  fi
}


not_installed() {
  program_name="$1"

  # Doesn't work if quoted
  return $(! is_installed "$program_name")
}


append_unique_to_file() {
  line="$1"
  file="$2"

  lines_found_in_file=$(grep -c "$line" "$file")
  if [[ lines_found_in_file -eq 0 ]]; then
    echo "$line" >> "$file"
  else
    echo "Line \"${line}\" already found in ${file}. Aborting..."
  fi
}


append_blank_line_to_file() {
  file="$1"
  
  blank_lines_at_eof=$(tail -n 1 "$file" | grep -c '^$')
  if [[ blank_lines_at_eof -eq 0 ]]; then
    echo "" >> "$file"
  fi
}


banner() {
  msg="$1"
  shift

  if is_installed figlet; then
    # Not quoting $@ is intentional. We want to pass remaining args to figlet
    # with splitting.
    figlet "$msg" $@
  else
    echo "$msg"
  fi
}


link_file() {
  src="$1"
  dest="$2"

  dateStr=$(date +%Y-%m-%dT%H%M%S) 
  
  if [[ -h "$dest" ]]; then
    echo "Removing existing symlink: ${dest}"
    rm "${dest}"
    
  elif [[ -f "$dest" ]]; then
    echo "Backing up existing file: ${dest}"
    mkdir -p "${BACKUP_DIR}"
    mv "$dest" "${BACKUP_DIR}/$(basename "$dest")_${dateStr}"

  elif [[ -d "$dest" ]]; then
    echo "Backing up existing directory: ${dest}"
    mv "$dest" "${BACKUP_DIR}/$(basename "$dest")_${dateStr}"
  fi

  echo "Linking file: ${dest}"
  ln -s "$src" "$dest"
}


link_files() {
  src_dir="$1"
  dest_dir="$2"

  files=$(find -H "$src_dir" -maxdepth 1 -name '*.symlink')

  for file_src in $files; do
    file=$(basename "$file_src")
    src="${src_dir}/${file}"
    dest="${dest_dir}/${file%.*}"
    link_file "$src" "$dest"
  done
}


ensure_cd() {
  path=$1
  cd "$path" || err_dir_not_found "$path"
}


# Error handling
err_dir_not_found() {
  dir=$1

  echo "Error: ${dir} not found. Exiting."
  exit 1
}
