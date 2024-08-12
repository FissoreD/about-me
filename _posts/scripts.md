---
title: "My scripts"
image:
  path: /assets/img/logo_script.png
...

## Remove tags from mp3 file

`pip install music-tag`

```py
from mutagen.mp3 import MP3
mp3 = MP3(FILE_NAME)
mp3.delete()
mp3.save()
```

A more complete example can be found [here]({{site.baseurl}}/assets/lib/mp3_tag_cleaner.py)

## Battery alert

To preserve the battery of the computer, it is useful to keep the battery level
between about $20\%$ and $85\%$. I have implemented a small script written in
bash language notifying at regular intervals if the battery goes below or above
these two bounds.

> Script with battery alert is [here]({{site.baseurl}}/assets/lib/battery_health)
{: .prompt-info }

If you want to modify the bounds or the interval of notifications, it is
sufficient to modify the values of the three variables `MAX_BATTERY`,
`MIN_BATTERY` and `SLEEP_TIME`.

To launch this script after the boot of the system, make the script executable
with `chmod u+x` and then add its path in the list of startup applications.

> The path of to the script should be absolute and you should use `/home/$USER`
> instead of the `~` symbol.
{: .prompt-info }
