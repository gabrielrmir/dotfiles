#! /usr/bin/sh

set -e

FILEPATH=""
LATESTPATH="${HOME}/screenshots/latest.png"
SOUNDPATH="${HOME}/.config/i3/sound.wav"
makepath () {
  FILEPATH="${HOME}/screenshots/$(date +%Y-%m-%d--%H-%M-%S | tr A-Z a-z).png"
  echo "${FILEPATH}"
}

maim --hidecursor -s "${LATESTPATH}"

if [ -f "${SOUNDPATH}" ]; then
  aplay "${SOUNDPATH}" &
fi

cp "${LATESTPATH}" "$(makepath)"

xclip -selection clipboard -t image/png "${LATESTPATH}"

notify-send 'Screenshot created'
