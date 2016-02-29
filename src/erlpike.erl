-module(erlpike).
-export([init/]).

init(Pool_name,Size)->
  init(Pool_name,Size,"localhost").

init(Pool_name,Size,Host)->
  init(Pool_name,Size,Host,3000).

init(Pool_name,Size,Host,Port)->


  {ok, ConnectId} = aerospike:connect(Host, Port)
  
