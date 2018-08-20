-module(test_meck_error_1).

-export([
  do_something/0
]).

do_something () -> ok.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-define(test(Desc, F), {setup, fun setup/0, fun cleanup/1, {Desc, F}}).

setup () ->
  ok.

cleanup (_) ->
  ok.

meck_error_1_test_ () ->
  [
    ?test("does something", fun test_do_something/0)
  ].

test_do_something () ->
  ?assertEqual(ok, do_something()).

-endif.
