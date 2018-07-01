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

