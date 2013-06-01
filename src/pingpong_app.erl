-module(pingpong_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    io:format("~p start~n", [?MODULE]),
    pingpong_sup:start_link().

stop(_State) ->
    io:format("~p stop~n", [?MODULE]),
    ok.
