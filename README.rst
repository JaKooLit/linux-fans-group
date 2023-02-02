# linux-fans-group
Linux Fan Group crowdsourced recommendations

Linux Fan Group
=========================

A Linux community, on facebook, which is pleasent, friendly, good-natured, and helpful.

In-depth discussions occur 24/7. know-how is revealed which should be: gathered, curated, made accessible, sharable, and forkable. Or at least put in one place.

Hopefully this leads to some collaboration amongst peers

presentation format
+++++++++++++++++++++++

Please organize into folders, by project name, not by distro.

one file
**************

Should be in vanilla ReStructuredText (.rst) format, so can easily be converted into a html or man page

multiple files
***************

format:   sphinx flavored ReStructured text
doc tech: sphinx

Sphinx can produce: user manual and pdf file. The user manual can be published to readthedocs.com

Setup a topic folder tree:

folders:

- _static 

- _build

- _template

- _misc
   
files:

- conf.py

- index.rst 

- Makefile

   #. **make html**
   
   #. **make pdf**
   

Sphinx rst

- `Sphinx RestructedText home <https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html>`_

- `Directives <https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html>`_

- `Roles <https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html>`_

License
+++++++++++

MIT

Know one owns this repository, feel free to fork it. Wherever is the more active fork, hope everyone can keep collaborating so we can all benefit

Authorship
+++++++++++++

Please cite sources. The person doing the curation isn't necessarily the same as the contributors of the know-how. The emphasis should be on both:

- the know-how

- giving credit

not on who is acting as curator(s)
