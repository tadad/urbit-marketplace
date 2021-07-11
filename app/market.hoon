/+  default-agent, dbug
%-  agent:dbug
^-  agent:gall
|_  =bowl:gall
+*  this      .
    default   ~(. (default-agent this %|) bowl)
::
++  on-init   on-init:default
++  on-save   on-save:default
++  on-load   on-load:default
++  on-poke   on-poke:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-peek   on-peek:default
++  on-agent  on-agent:default
++  on-arvo   on-arvo:default
++  on-fail   on-fail:default
--