-module(erlpike).
-export([init/2,init/3,init/4,acceptor_loop/2]).

init(Pool_name,Size)->
  init(Pool_name,Size,"localhost").

init(Pool_name,Size,Host)->
  init(Pool_name,Size,Host,3000).

init(Pool_name,Size,Host,Port)->
  Workers_list=start_workers(Pool_name,Size,Host,Port,[]),
  register(erlpike,spawn(?MODULE,acceptor_loop,[Workers_list])),
  ok.

start_workers(Pool_name,0,Host,Port,Workers)
  Workers;

start_workers(Pool_name,Size,Host,Port,Workers)
  {ok, ConnectId} = aerospike:connect(Host, Port),
  New_workers=[ConnectId|Workers],
  start_workers(Pool_name,Size-1,Host,Port,New_workers).

acceptor_loop([],Main_w_list)->

acceptor_loop(Queue,Main_w_list)->
  [Head,Tail]=Queue,
  recieve
    stop->stopped;
    {set}->set;
    {get}->get;
    {delete}->delete
  end.
