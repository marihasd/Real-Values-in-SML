%%%
%% chat_server.erl
%% Submitted 15 April 2024 5:05 pm
%% To compile program in server enter:
%% erlc chat_server.erl
%% Output is server pid
%% erlc chat_client.erl
%% erlc chat_script.erl
%% To launch type 'erl' then:
%% chat_server:start_link().
%%  chat_script:start().
%% To send message: chat_client:send_message(<0.88.0>, "Your message here").
%% Replace 0.88.0 with your server pid
%% Erlang Chat Server - gen_server module
%% Maintains a list of connected clients and handles incoming messages
%% Sends a copy of incoming messages to all other clients
%%% 

-module(chat_server).
-behavior(gen_server).

-export([start_link/0, init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link({local, chat_server}, ?MODULE, [], []).

init([]) ->
    {ok, []}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({message, Message}, State) ->
    NewState = broadcast_message(Message, State),
    {noreply, NewState}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

broadcast_message(Message, State) ->
    lists:foreach(fun(Pid) -> Pid ! {message, Message} end, State).
