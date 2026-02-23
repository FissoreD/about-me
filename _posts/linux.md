---
title: "Linux"
image:
  path: /assets/img/logo_linux.png
...

## Useful commands

| Description            | Command                               |
| ---------------------- | ------------------------------------- |
| Restart gnome shell    | `ALT + F2, then r`                    |
| Force kill process     | `kill -9 PID`                         |
| Switch virtual console | `CTRL + ALT + F1`                     |
| Install deb            | `dpkg -i DEB_FILE`                    |
| Regex replace          | `echo ... \| sed 's/IN_REX/OUT_REX/'` |

## Hints on makefile

```makefile
# Create a local variable in a rule
rule1:
  $(eval VAR := $(shell YOUR_COMMAND))
  echo $(VAR)

# Apply rule to all tex files
RES_DIR = pdf
SOURCES = $(shell ls *.tex)
OBJECTS = $(addprefix $(RES_DIR)/,$(SOURCES:%.tex=%.pdf))
ci: $(OBJECTS)
$(RES_DIR)/%.pdf: %.tex
  ...
```

| Description              | Command                                |
| ------------------------ | -------------------------------------- |
| Variable local to target | `$(eval year := $(shell YOUR_COMMAND))` |

## Useful packages

In the following sections some packages I find quite useful

### Zsh

**zsh** is an alternative to the bash terminal, it has a powerful autocompletion
engine. It can be installed trough `sudo apt-get install zsh` and can be set
as default terminal with `chsh -s $(which zsh)`. I have experienced some
troubles with this command and a small hack to solve this problem is to run the
following line of code.

```bash
echo -e "\nexport SHELL=\"/usr/bin/zsh\"" >> $HOME/.profile
```

> File with a custom version to be sourced in .zshrc is [here]({{site.baseurl}}/assets/lib/myzshrc)
{: .prompt-info }

#### Set keybindings for history search
```bash
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[5~" history-beginning-search-backward-end
bindkey "^[[6~" history-beginning-search-forward-end
```

> To get the keycode associated to a key, enter the command `cat` in a terminal 
> end then type the wanted key 


### Copyq

Copy/paste is a feature daily used on computers. The **copyq** package allows to
keep in memory the list of all the copied texts so that you can paste them in a
second moment. It can be installed through `sudo apt-get install copyq`. This
package can be launched at boot by adding the
command **`copyq --start-server`** in the list of startup applications.

### Pandoc

Latex is a standard package to render professional and readable pdf files. It is
sometime the case that setting up all the configuration for a latex environment
is not so practical. An alternative to this is to use the **pandoc** package
which allows to *convert markdown files into pdf* using the latex engine. Pandoc
is also capable to convert md files into html.

To render html files, I usually run:

```bash
pandoc --toc --number-sections -s --embed-resources --standalone  \
  inFile                                                          \
  --mathjax=path2/tex-chtml-full.js                               \
  --include-in-header=path2/header.html                           \
  --lua-filter=path2/luaFile.lua
```

where

1. `inFile` is the markdown file to be rendered in html
2. `tex-chtml-full.js` is the js file allowing to render mathjax in html
3. `header.html` contains some html code to be added in the header of the
   rendered html
4. `luaFile.lua` is a lua file allowing to preprocess the markdown file before
   the html rendering is done

> The list of options passed to the pandoc command produces a standalone html
> document with `toc` and where the sections are numbered
{: .prompt-info }

### Miscellaneous

- **Opam** is the package manager used for ocaml projects. The following post gives
  more details about how you can deal with it, see [here]({{site.baseurl}}/posts/opam)
- **python-is-python3** allowing to call `python` is the terminal instead of
  `python3`
- **VSCode** on of the most used IDE worldwide (the package name is `code`)
- **pygments** is a python extension to compile `minted` code of tex files


## Install the previous packages

In a new computer, I usually run the following list of command to install the
packages/scripts mentioned above. I also initialize `opam`

```bash
sudo apt-get install \
  code zsh python-is-python3 \
  opam copyq texlive-latex-extra python3-pip &&
wget \
  "https://github.com/jgm/pandoc/releases/download/3.1.9/pandoc-3.1.9-1-amd64.deb" \
  "https://fissored.github.io/MyHelp/zip/battery_health"
  "https://fissored.github.io/MyHelp/zip/opam_switch_coq_elpi.txt" &&
mv ./battery_health /home/$USER \
pip install pygments \
sudo dpkg -i pandoc-3.1.9-1-amd64.deb
```
> `battery_alert` is documented [here]({{site.baseurl}}/posts/scripts#battery-alert)
{: .prompt-info }

## Miscellaneous
Set local time:

```bash
echo -e "\nexport LC_TIME=\"en_IE.utf8\"" >> $HOME/.profile
```

> `en_IE.utf8` is for _English, Ireland_

Set local paper size:

```bash
echo -e "\nexport LC_PAPER=\"en_GB.UTF-8\"" >> $HOME/.profile
```