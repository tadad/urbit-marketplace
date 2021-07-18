/-  *post
|%
::
:: market data types
::
+$  item
  $:
    seller=ship
    =index
    name=cord
    description=(list content)
    image-url=cord
    price=@r
    time-posted=time
    :: =signature
    :: reviews=(list post) :: from graph-store
  ==
::
::  actions
::
+$  client-action
  $%
    [%subscribe host=ship]
    [%leave host=ship]
    [%make-offer item=uid] :: should be an index from graph store. fix later
    [%remove-offer item=uid]
  ==
+$  server-action
  $%
    [%add-item =item]
    [%remove-item =index]
    [%accept-offer offer=uid]
    [%reject-offer offer=uid]
  ==
--