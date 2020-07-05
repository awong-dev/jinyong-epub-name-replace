# jinyong-epub-name-replace
Code to change the Proper Names in Jinyong epubs with preferred spellings.

## Why does this exist?

Finally, after decades, an official professional English translation for
Legend Of the Condor Heroes is here!

https://us.macmillan.com/books/9781250220608

However, the transltor made some rather controversial choices with
translating the proper names. Some of the names had the character
meanings translated with the order swapped (eg Skyfury Guo versus
Guo Xiaotian). Others were left in straight pinyin. For the new
reader, this probably just feels a little exotic, but for someone
who might have grown up with these characters in other mediums
the names are extremely jarring. Sorta like replacing "Thor"
with "Norse God Of Thunder" everywhere.

This set of scripts is a small hack meant to be applied to the
epub of the electronic version of the book that will produce
a new epub with whatever proper nouns are wanted.

It is a work in progress as I read through the book and find
more proper nouns to insert.

Patches welcome!

## How to use.
This assumes you have a mac. Linux may work as well, but untested.
To convert, run

```
$ ./rename.sh pinyin "A Hero Born.epub"
```

This will generate `A Hero Born - pinyin.pub" with all names listed
in `name-remap.csv` swapped to pinyin.

You can also run:

```
$ ./rename.sh trad "A Hero Born.epub"
$ ./rename.sh simp "A Hero Born.epub"
```

To produce version using actual chinese characters for the names.
However, this will be a little odd without listing more (all?) proper names.
