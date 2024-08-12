---
layout: post
# the default layout is 'page'
icon: fas fas fa-home
order: 1
---


## About me

I am a PhD student at the
[Inria](https://www.inria.fr/fr/centre-inria-universite-cote-azur) center of
Sophia Antipolis in the [STAMP](https://team.inria.fr/stamp/) team under the
supervision of [Yves Bertot](https://www-sop.inria.fr/members/Yves.Bertot/) and
[Enrico Tassi](https://www-sop.inria.fr/members/Enrico.Tassi/).

## My interest

I like to challenge myself with any kind of puzzle such as the Rubik's cube or
the game of Chess. In my free time I like to participate to coding battle since,
after all, they are puzzles!

I like to listen to music especially music played on piano, such as the great
masterpieces of composers like Bach and Beethoven.


<!-- ## Some words about my research

I am currently studying a new [type class
solver](https://coq.inria.fr/doc/V8.19.0/refman/addendum/type-classes.html)
solver for [Coq](https://github.com/coq/coq) written in
[Elpi](https://github.com/LPCIC/elpi). The principal goal is to provide an
alternative to the original Coq solver that users can easily customize and
adapt to behave as they would expect in their libraries. The main directions of my
research include:

- transposing the unification algorithm of the object language (coq) into the
  meta language (elpi) logic up to $\eta\beta$-equivalence. For instance, given
  two terms of the object language, we aim to transform them into terms of the
  meta language. These second terms can then be unified by the meta
  language providing (if needed) instantiation of unification variables. If the
  unification succeed, the instantiated variables in the meta-language are
  linked to the unification variables of the object language. The substitution
  given to the object language by the meta language is the most general one.
- introducing a static check on instance creation so that some property of the
  class can be verified. For example, if the class should behave as a function,
  the Elpi instance compiler should verify whether the newly created instance still
  guarantees the class to be functional. This feature should inform the user,
  for example, if they are creating an instance overlapping with already existing
  instances
- specializing the program on specific goals so that the specialized version of
  the program cane to solve quickly difficult goals
- *wish:* studying a first-order (or even higher-order) memoization process in the solver so that
  any goal encountered in the current search is stored in a dedicated memory.
  This memory is then used to verify if a new goal has already been seen in a
  previous search, and, if so, the memoisation algorithm should immediately determine
  if that goal has a solution or not. -->

## A short list of my projects

During my experience as a computer scientist, I have realized different
projects. I would like to list some of them:

<style>
  .proj-item p {
    display: contents;
  }
</style>
{% assign projects = site.data.cv-data.projects %}
<ul>
{% for project in projects.assignments %}
    <li class="proj-item">
      {% if project.link %} <a href="{{ project.link }}">{{ project.title }}</a>
      {% else %} <li>{{ project.title }}</li>
      {% endif %}:
      {{ project.tagline | markdownify }}
    </li>
{% endfor %}
</ul>
