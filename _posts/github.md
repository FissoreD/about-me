---
title: "Git & Github"
image:
  path: /assets/img/logo_github.png
...

## Main commands

| Description                   | Command                                    |
| ----------------------------- | ------------------------------------------ |
| Clean brute force             | `git clean -dfx`                           |
| All branch names              | `git show-ref`                             |
| Add worktree                  | `git worktree add PATH EXISTING_BRANCH`    |
| Add worktree new branch       | `git worktree add -b NEW_BRANCH_NAME PATH` |
| Fetch all                     | `git fetch --all`                          |
| Show remote list              | `git remote show`                          |
| Show remote url               | `git remote -v`                            |
| Rename remote                 | `git remote rename OLD_NAME NEW_NAME`      |
| Remove branch locally         | `git branch -d BRANCH_NAME`                |
| Remove branch globally        | `git branch --delete BRANCH_NAME`          |
| Stash selected files          | `git stash -- file names`                  |
| Stash only unstaged files     | `git stash push --keep-index`              |
| Undo last local commit        | `git reset HEAD~`                          |
| Add remote repo               | `git remote add NEW_NAME GITHUB_URL`       |

## Git pre-commit

Sometimes it is useful to test the repository before committing your modification
to git. This test can be run locally and, if it passes, the commit will be 
executed. To add this pre-commit test, you need to add/edit the file in 
`./.git/hooks/pre-commit` (which should be an executable file, i.e. `chmod u+x`).

An minimal example of `pre-commit` file could be:

```sh
#!/usr/bin/env bash

make test >& /dev/null
RESULT=$?

if [[ ${RESULT} -ne 0 ]]
then
  RED='\033[0;31m'
  printf "${RED}Unit tests failed. Commit rejected\n"
fi
exit ${RESULT}
```

The `pre-commit` file can also run custom scripts, for example, you can do

```sh
#!/usr/bin/env bash
./my-script.sh
```

where `./my-script.sh` is at the root of the git folder

> source: [here](https://betterprogramming.pub/no-more-failing-builds-8ac07ac3572c)

An interesting pre-commit file to trim trailing spaces can be found [here]({{site.baseurl}}/assets/lib/pre-commit-trim-space.sh) ([source](https://github.com/imoldman/config/blob/master/pre-commit.git.sh))

## Har reset to commit hash

1. `git reflog`
2. find the commit labeled `HEAD@{N} rebase (start)` when `N` is a number
3. `git reset --hard HEAD@{N-1}`

for example, if I do `git rebase target-branch` and want to reset my branch before a rebase,
I should find a line like `HEAD@{196}: rebase (start): checkout xx/target-branch`
in the `git reflog`. Then I should simply run `git reset --hard HEAD@{195}`


## Squash commits

1. take a commit hash before the commit you want to squash
2. `git rebase -i COMMIT_HASH`
3. in the interactive window, chose the commits to squash and replace `pick` with `s` 
4. run `git push origin BRANCH_NAME -f`

> source: [here](https://www.ekino.fr/publications/comment-squasher-efficacement-ses-commits-avec-git/) 

## Set ssh key

```bash
> ssh-keygen -t rsa
> git config --global user.name "Your Name"
> git config --global user.email "Your email address"
> cat ~/.ssh/id_rsa.pub                       # Copy/paste it into the SSH setting panel of github
```

## Set gpg key

```bash
> sudo apt-get install gnupg;
> gpg --full-generate                         # Set RSA length to 4096
> gpg --list-secret-keys --keyid-format=long  # KEY_ID is between `sec rsa4096/` and expiring date
> gpg --armor --export KEY_ID                 # Copy/paste it into the GPG setting panel of github
> git config --global commit.gpgsign true     # To set gpg sing to true
> git config --global user.signingkey KEY_ID  # Set the key id of the gpg key
```

## Clone remote folder in current branch

1. git remote add bar https://github.com/uns-iut-info/you-are-unique-time-to-tank
2. git remote update
3. git switch -c baz
4. git merge --allow-unrelated-histories bar/main
5. git push -u origin main

## Useful links

- [https://www.nobledesktop.com/learn/git/git-branches](https://www.nobledesktop.com/learn/git/git-branches)
- [Git Gui](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Graphical-Interfaces)
- [Autolinked references and URLs](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls)