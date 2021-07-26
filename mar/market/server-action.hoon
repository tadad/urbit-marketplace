/-  market
=,  format
|_  act=server-action:market
++  grab
  |%
  ++  noun  server-action:market
  ++  json
    |=  jon=^json  ::  what is ketjson?
    %-  server-action:market
    =<  (server-action jon)
    |%
    ++  server-action
      %-  of:dejs
      :~  [%add-item item] :: explain this???
          [%remove-item index]  :: this comes from grpah store so maybe I can just pull something from that mark file/
          :: [%accept-offer offer]
          :: [%reject-offer offer]
      ==
    ++  item
      %-  ot:dejs
      :~  [%seller (su:dejs fed:ag)]
          [%index (ar:dejs ni:dejs)]
          [%name so:dejs]  ::  string as cord
          [%description so:dejs]  :: (ar:dejs so:dejs)]
          [%image-url so:dejs]
          [%price ne:dejs]
          [%time-posted (se:dejs %da)]
      ==
    ++  index
      %-  ot:dejs
      :~  [%index (ar:dejs ni:dejs)]
      ==
    --
  --
++  grow
  |%
  ++  noun  act
  --
--