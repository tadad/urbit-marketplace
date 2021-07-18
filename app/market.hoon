/-  *market
/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-0
  ==
::
+$  state-0  [%0 items=(set item)]
::
+$  card  card:agent:gall
::
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
=<
|_  =bowl:gall
+*  this      .
    default   ~(. (default-agent this %|) bowl)
    helper        ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  'on-init'
  ~&  >>>  '%connect Eyre to ~lifecycle'
  :_  this(state [%0 (sy *(list item))])
    :~
      [%pass /bind %arvo %e %connect [~ /'~lifecycle'] %lifecycle]
    ==
++  on-save
  ~&  >  'on-save v0'
  !>(state)
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  ~&  >  'on-load v0'
  =/  prev  !<(versioned-state old-state)
  ?-  -.prev
    %0
    ~&  >>>  '%0'
    `this(state prev)
    ::
  ==
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:default mark vase)
      %noun
    ?+    q.vase  (on-poke:default mark vase)
        %print-state
      ~&  >>  state  `this
        %remove-market
      ~&  >>  'remove the market here'  `this
    ==
      %market-server-action
      ~&  >>>  !<(server-action vase)
      =^  cards  state
      (handle-server-action:helper !<(server-action vase))
      [cards this]

      %market-client-action
      ~&  >>>  !<(client-action vase)
      =^  cards  state
      (handle-client-action:helper !<(client-action vase))
      [cards this]
  ==
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-peek   on-peek:default
++  on-agent  on-agent:default
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+    wire  (on-arvo:default wire sign-arvo)
      [%bind ~]
    ~&  >>  'Eyre confirmed the %connect'
    `this
  ==
++  on-fail   on-fail:default
--
::  helper core
|_  bowl=bowl:gall
++  handle-server-action
  |=  action=server-action
  ^-  (quip card _state)
  ~&  >>>  'action'
  ?-  -.action
    %add-item
  ~&  >>>  'add item'  `state
    %remove-item
  ~&  >>>  'remove item'  `state
    %accept-offer
  ~&  >>>  'accept item'  `state
    %reject-offer
  ~&  >>>  'reject item'  `state
  ==
++  handle-client-action
  |=  action=client-action
  ^-  (quip card _state)
  ?-  -.action
    %subscribe
  ~&  >>>  'subscribe'  `state
    %leave
  ~&  >>>  'leave'  `state
    %make-offer
  ~&  >>>  'make-offer'  `state
    %remove-offer
  ~&  >>>  'remove offer'  `state
  ==
--