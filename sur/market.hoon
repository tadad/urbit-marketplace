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
    :: offers=(list offer)
    :: =signature
    :: reviews=(list post) :: from graph-store
  ==
+$  offer
  $:
    item=index
    amount=@r
    from=ship
  ==
::
::  actions
::
+$  client-action
  $%
    ::  [%subscribe host=ship]
    ::  [%leave host=ship]
    [%make-offer =offer] :: should be an index from graph store. fix later
    [%remove-offer =offer]
  ==
+$  server-action
  $%
    [%add-item =item]
    [%remove-item =index]
    [%accept-offer =offer]
    [%reject-offer =offer]
  ==
--