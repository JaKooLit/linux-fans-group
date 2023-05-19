Show/set kernel option from a Makefile. Persistant

Usage
=======

Show current *kernel option* value
-----------------------------------------

Long form
~~~~~~~~~~~~

``sudo make key="vm.swappiness" desktop``

Short form
~~~~~~~~~~~~

``sudo make``

Short form with different key
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``sudo make key="vm.someotherkey"``


Since fallback *kernel option* is *vm.swappiness* and default Makefile target calls *desktop*


   | 30
   | To set, `make val=30 desktop` or `make val=30 key="vm.swappiness" desktop`
   | Recommandations. Server 60. Desktop 30
   

Set kernel option value
---------------------------

Long form
~~~~~~~~~~~~

``sudo make val=30 key="vm.swappiness" desktop``

Short form
~~~~~~~~~~~~

``sudo make val=30``

   | vm.swappiness = 30
   

Short form with different key
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``sudo make val=30 key="vm.someotherkey"``




Thanks to
===========

* `Jefferson Grindle`_
* `Dave Faulkmore`_

.. _Jefferson Grindle: https://www.facebook.com/jefferson.grindle
.. _Dave Faulkmore: faulkmore@telegram
