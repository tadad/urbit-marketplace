/-  *market
/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-0
  ==
::
+$  state-0
  $:  %0
      items=(map index item)
      offers=(jug index offer)
  ==
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
    helper    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  'on-init'
  ~&  >>>  '%connect Eyre to ~market'
  =/  filea  [%file-server-action !>([%serve-dir /'~market' /app/market %.y %.n])]
  :-  :~  [%pass /srv %agent [our.bowl %file-server] %poke filea]
      ==
  %_  this
      state
    :*  %0
        *(map index item)
        *(jug index offer)
    ==
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
++  on-peek
  |=  pax=path
  ^-  (unit (unit cage))
  ~&  >>>  pax
  ?+    pax  (on-peek:default pax)
      [%x %items ~]
    ``noun+!>(items)
      [%x %offers ~]
    ``noun+!>(offers)
      [%x %no-result ~]
    [~ ~]
  ==
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
  ::
    %add-item
  =.  items.state  (~(put by items.state) index.item.action item.action)
  `state
  ::
    %remove-item
  =.  items.state  (~(del by items.state) index.action)
  `state
  ::
    %accept-offer
  ~&  >>>  'accept item'  `state
  ::
    %reject-offer
  ~&  >>>  'reject item'  `state
  ==
++  handle-client-action
  |=  action=client-action
  ^-  (quip card _state)
  ?-  -.action
    %make-offer
  ~&  >>>  'make-offer'
  =.  offers.state  (~(put ju offers.state) item.offer.action offer.action)
  `state
    %remove-offer
  ~&  >>>  'remove-offer'
  =.  offers.state  (~(del ju offers.state) item.offer.action offer.action)
  `state
  ==
--