%%%-------------------------------------------------------------------
%% @doc test_meck_error public API
%% @end
%%%-------------------------------------------------------------------

-module(test_meck_error_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    test_meck_error_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
