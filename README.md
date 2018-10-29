# .dotfiles for donatoaz

## quick reference

### autosquashing commits

```
gaa && git commit --fixup HASH
```

or 

```
gaa && git commit --fixup :/term
```

Where `term` shows up in the first line of the commit you want to fixup

These add a new commit fixing up `HASH`. Now to autosquash it:

```
git rebase -i
```

Autosquashing is enabled by default on the `.gitconfig` file of this repo.

### Create a new github repo from the terminal

```
curl -u "your_user_name" https://api.github.com
curl -u "your_user_name" https://api.github.com/user/repos -d '{"name":"repo_name"}'
```

### Inserting in vertical block mode in vim

* Enter vertical block mode with `CTRL+v`
* Press `I` (capital "eye")
* Type in what you want -- it will look like you are only inserting in the first line
* When you are done, press `ESC` and `j`

