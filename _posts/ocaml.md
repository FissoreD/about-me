---
title: "Ocaml"
image:
  path: /assets/img/logo_opam.png
...

## perf: profile ocaml performance

| Description        | Command                                                           |
| ------------------ | ----------------------------------------------------------------- |
| Profile file       | `sudo perf record --call-graph lbr -- OCAML_BIN`                  |
| Profile with name  | `sudo perf record --call-graph lbr -o perf.data.old -- OCAML_BIN` |
| Compare perf files | `sudo perf diff perf.data.old perf.data`                          |

## Opam

### Main commands

| Description          | Command                                                        |
| -------------------- | -------------------------------------------------------------- |
| Create global switch | `opam switch create SWITCH_NAME 4.14.1`                        |
| Create local switch  | `opam switch create . 4.14.1`                                  |
| Remove switch        | `opam switch remove SWITCH_NAME`                               |
| Export switch        | `opam switch export FILE_EXPORT.txt --switch SWITCH_NAME`      |
| Import switch        | `opam switch import FILE_EXPORT.txt --switch SWITCH_NAME`      |
| Install only deps    | `opam install --deps-only PKG_NAME`                            |
| Pin git branch       | `opam pin add https://github.com/PATH_TO_REPO.git#BRANCH_NAME` |

### Create empty switch for coq

1. `opam switch create SWITCH_NAME 4.14.1`
2. `opam switch SWITCH_NAME`
3. `eval $(opam env)`
4. `opam install --deps-only coq-core coq-elpi ocamlformat`
5. `./configure`
   - the first answer is `/home/USER/.opam/SWITCH_NAME/bin`
   - the other add the suggested postfix to the previous path without bin
6. `make world`
7. `dune install coq-core coq-stdlib coqide-server`

### Rectype error in lsp-server

> Use merlin file to get dependency in a ocaml project not using `dune`

1. `make .merlin`
2. `touch dune-project`
3. in `./.vscode/settings.json`
   ```
   "ocaml.server.args": [
        "--fallback-read-dot-merlin"
    ]
   ```

### Vnorm error in coq-elpi

`git clean -dfx`

### Opam exported files

- Coq end elpi : [here]({{site.baseurl}}/assets/lib/opam_switch_coq_elpi.txt)

### Useful links

[https://opam.ocaml.org/doc/FAQ.html](https://opam.ocaml.org/doc/FAQ.html)