
Generate random word combinations from a linefeed-separated list `words.txt` like
e.g. from https://github.com/davidak/wortliste

```
$ ./xkcd936
Kartoffelkäferbefall-Altersteilzeitregelung-auseinanderbersten-Gezücht
```

If that sounds odd, see https://xkcd.com/936/

Caution: this approach has a statistical bias toward longer words but avoids to
actually read the wordlist (O(1), sic!), so it may be as big as you like.

## Similar

* λλ= https://github.com/utgarda/correct-unicorn
* ☕️ https://github.com/maandree/correctpony

