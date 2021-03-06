# Detailed documentation for some of these tools can be found here:
# https://github.com/maxxxxxdlp/code_share/tree/main/Python/

# Run text to speech on piped text or on the file provided as first
# argument or on the default file
alias tts="~/site/python/python_tts/venv/bin/python ~/site/python/python_tts/run.py"

# Open the current repository or one of it's files/directories in GitHub
# on the current or provided branch
alias g="python3 ~/site/git/code_share/Python/github/github.py"

# `f` because `cc`, `dc`, `dd` and `ss` is already taken :)
f() {
  script_dir="${HOME}/site/python/dir_explorer/dir_explorer"

  # Create a temp file
  export tempfile="/tmp/list_view_$RANDOM"

  # Call the python script
  "${script_dir}/../venv/bin/python3" "${script_dir}/list_view.py" "$@"

  # Capture the output
  if [[ -f "$tempfile" ]]; then
    OUTPUT=($(cat $tempfile))
    # Clean up the temp file
    rm $tempfile
    unset tempfile

  else
    return 0
  fi

  echo "${OUTPUT[1]}/${OUTPUT[2]}"
  cd "${OUTPUT[1]}"

  l

  # If script returned a file name
  if [[ -f "${OUTPUT[1]}/${OUTPUT[2]}" ]]; then
    # Open the file in the default editor
    eval "${EDITOR:-vi}" "${OUTPUT[2]}"
  fi

}

# Play a notification sound. Useful when chained at the end of another
# program
alias notify="afplay /System/Library/Sounds/Funk.aiff &>/dev/null &"

# Run a dockerized youtube-dl with some default parameters
# Also, can be called like `yt <URL> && notify` to receive a
# completion notification
alias yt='docker run \
  --rm -i \
  -e PGID=$(id -g) \
  -e PUID=$(id -u) \
  -v "$(pwd)":/workdir:rw \
  mikenye/youtube-dl \
  -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

# Run a dockerized version of ffmpeg
ffmpeg() {
  docker run \
    --rm \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    jrottenberg/ffmpeg:scratch \
    $@
}

# Find the `.idea/` directory among parent directories and open that
# project in PyCharm
pycharm() {
  open -na "PyCharm.app" --args $(python3 ~/site/git/code_share/Python/finder/finder.py .idea/ || echo "") $@
}

alias openconnect="sudo openconnect \
  --user=m001p596 \
  --authgroup=Default \
  https://kuanywhere.ku.edu"

ovpn() {
  sudo /usr/local/opt/openvpn/sbin/openvpn --config "${HOME}/Documents/ovpn/$1"
}
# Define autocomplete
_ovpn() {
  reply=($( (cd ~/Documents/ovpn/ && ls *.ovpn)))
}
compctl -K _ovpn ovpn
