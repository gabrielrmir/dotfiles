#! /usr/bin/sh

set -e

FILEPATH=""
LATESTPATH="${HOME}/Pictures/Screenshots/latest.png"
SOUNDPATH="${HOME}/.config/i3/sound.wav"
makepath () {
  FILEPATH="${HOME}/Pictures/Screenshots/$(date +%Y-%m-%d--%H-%M-%S | tr A-Z a-z).png"
  echo "${FILEPATH}"
}

maim --hidecursor -s "${LATESTPATH}"

if [ -f "${SOUNDPATH}" ]; then
  aplay "${SOUNDPATH}" &
fi

cp "${LATESTPATH}" "$(makepath)"

xclip -selection clipboard -t image/png "${LATESTPATH}"

notify-send 'Screenshot created'
