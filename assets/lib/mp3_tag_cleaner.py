import sys
from mutagen.mp3 import MP3

for i in sys.argv[1:]:
    if (not (i.endswith(".mp3"))): continue
    print("start",i)
    mp3 = MP3(i)
    mp3.delete()
    mp3.save()
    print("end",i)