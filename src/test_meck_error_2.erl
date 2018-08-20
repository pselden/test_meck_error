-module(test_meck_error_2).

-export([
  do_something_else/0
]).

do_something_else () -> ok.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-define(test(Desc, F), {setup, fun setup/0, fun cleanup/1, {Desc, F}}).

setup () ->
  meck:new ([test_meck_error_1], [no_passthrough_cover]).

cleanup (_) ->
  meck:unload ().

meck_error_1_test_ () ->
  [
    ?test("something else should call something", fun test_do_something_else/0)
  ].

test_do_something_else () ->
  meck:expect(test_meck_error_1, do_something, fun () -> error end),
  ?assertEqual(ok, do_something_else()).

-endif.
