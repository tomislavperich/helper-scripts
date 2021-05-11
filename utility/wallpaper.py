#!/usr/bin/env python3

import os
import sys
import argparse
from pathlib import Path

try:
    from halo import Halo
    use_halo = True
except ImportError:
    use_halo = False
    pass

# Paths
wallpapers = {
    "local": {
        "unsplash": {
            "default": "Pictures/Wallpapers/Unsplash"
        },
        "wallhaven": {
            "default": "Pictures/Wallpapers/Wallhaven/Default",
            "landscape": "Pictures/Wallpapers/Wallhaven/Landscapes",
            "cyber": "Pictures/Wallpapers/Wallhaven/Cyber",
            "hot": "Pictures/Wallpapers/Wallhaven/Hot",
            "scifi": "Pictures/Wallpapers/Wallhaven/SciFi", 
            "misc": "Pictures/Wallpapers/Wallhaven/Misc",
        },
        "other": {
            "space": "Pictures/Wallpapers/Space",
            "synthwave": "Pictures/Wallpapers/Synthwave",
            "red": "Pictures/Wallpapers/Red",
        }
    },
    "remote": {
        "unsplash": {
            "default": "https://source.unsplash.com/1920x1080/?scifi",
            "daily": "https://source.unsplash.com/daily",
            "random": "https://source.unsplash.com/random/1920x1080"
        }
    }
}
home_path = Path.home()
default_path = wallpapers["local"]["wallhaven"]["landscape"]


# Instantiate argument parser
parser = argparse.ArgumentParser(description='Set a wallpaper with pywal')
parser.add_argument(
    '-p',
    '--path',
    help='Path to pick a random wallpaper from',
    default=default_path
)


# Get random image's path
def get_random_image_path(path: str) -> str:
    spinner = Halo(text='Loading wallpaper') if use_halo else None
    spinner.start() if spinner else None

    image_file = os.popen(
        f'ls -pt {path} | grep -v "/$" | sort -R | head -n 1'
    ).read()

    spinner.succeed() if spinner else None
    return f'{path}/{image_file}'


# Set color scheme and set as wallpaper
def set_as_wallpaper(path: str) -> None:
    os.system("notify-send 'Changing wallpaper...'")
    spinner = Halo(text='Setting wallpaper') if use_halo else None
    spinner.start() if spinner else None

    os.system(f'wal -qi {path}')
    os.system(f'feh --bg-fill {path}')

    spinner.succeed() if spinner else None
    os.system("killall notify-osd")


def main():
    args = parser.parse_args()
    wallpaper_path = args.path

    # Handle local wallpapers
    if not wallpaper_path.startswith('http'):
        absolute_path = os.path.abspath(wallpaper_path)
        wallpaper_path = get_random_image_path(absolute_path)

    set_as_wallpaper(wallpaper_path)


if __name__ == '__main__':
    main()
