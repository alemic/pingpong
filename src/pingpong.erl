-module(pingpong).

-behaviour(gen_server).

-export([ping/0, start_link/0, start/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start() ->
    application:load(pingpong),
    application:start(pingpong).

start_link() ->
    io:format("~p start_link~n", [?MODULE]),
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

ping() ->
    io:format("~p ping~n", [?MODULE]),
    gen_server:call(?MODULE, ping).

init([]) ->
    process_flag(trap_exit, true),
    io:format("~p init~n", [?MODULE]),
    {ok, []}.

handle_call(ping, _From, N) ->
    io:format("~p handle_call ping~n", [?MODULE]),
    {reply, pong, N}.

handle_cast(_Msg, N) ->
    io:format("~p handle_cast~n", [?MODULE]),
    {noreply, N}.

handle_info(_Msg, N) ->
    io:format("~p handle_info~n", [?MODULE]),
    {noreply, N}.

terminate(_Reason, _State) ->
    io:format("~p terminate~n", [?MODULE]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    io:format("~p code_change~n", [?MODULE]),
    {ok, State}.
