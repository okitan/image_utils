# image utils

## exif を確認する

```console
$ identity -verbose "$src"
```

## exif を削除する

```console
$ convert -strip "$src" "$dist"
```

一括で削除し名前を連番にするには `strip_all.sh` が便利
