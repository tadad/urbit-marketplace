/-  market
=,  format
|_  act=client-action:market
++  grab
  |%
  ++  noun  client-action:market
  ++  json
    |=  jon=^json  ::  what is ketjson?
    %-  client-action:market
    =<  (client-action jon)
    |%
    ++  client-action
      %-  of:dejs
      :~  [%make-offer offer]
          [%remove-offer offer]
      ==
    ++  offer
      %-  ot:dejs
      :~  [%index (ar:dejs ni:dejs)]
          [%amount ne:dejs]
          [%from (su:dejs fed:ag)]
      ==
    --
  --
++  grow
  |%
  ++  noun  act
  --
--