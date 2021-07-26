/-  market
|%
++  test-test  :: all test arms must begin with "test-"
  ^-  tang
  ?>  =(1 1)
  ~
++  test-add-item
  ^-  tang
  =/  new-item=item:market
    [
      seller=~zod
      index=~[1 1 1]
      name='test item'
      description='description'  ::  not doing (list content) anymore ::[[%text 'test description 123'] ~]
      image-url='https://example.com/test.jpeg'
      price=`@r`123.123
      time-posted=~1776.7.4
      offers=*(list offer)
    ]
  =/  offer=offer:market
    [
      item=~[0]
      amount=`@r`123.123
      from=~dachus
    ]
  ?>  =(1 1)
  ~
--