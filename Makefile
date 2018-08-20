NAME?=test-meck-error
ERLANG_VERSION?=19

.PHONY: default
default: devshell

.PHONY: devshell
devshell:
	@docker run \
		--rm \
		--name=${NAME}-dev \
		-v ${CURDIR}:/test_meck_error \
		-ti erlang:${ERLANG_VERSION} \
		/bin/bash -c 'cd /test_meck_error; bash;'
