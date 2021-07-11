/-  *post
=,  post
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
::  might want to include more info? tbd...
+$  marketplace  (set item)
::
::  actions
::
+$  client-actions
  $%
    [%subcribe host=ship]
    [%leave host=ship]
    [%make-offer item=uid] :: should be an index from graph store. fix later
    [%remove-offer item=uid]
  ==
+$  server-actions
  $%
    [%add-item =item]
    [%remove-item index=uid] :: item ID. index=(list @) from graph store)
    [%accept-offer offer=uid]
    [%reject-offer offer=uid]
    [%remove-market]
    ==
--