RED=\033[0;31m
GRE=\033[0;32m
RES=\033[0m
MAG=\033[0;35m
CYN=\033[0;36m
RL1=\033[0;41m
BL1=\033[0;44m

GO_SRC_DIRS := $(shell \
	find . -name "*.go" -not -path "./vendor/*" | \
	xargs -I {} dirname {}  | \
	uniq)

GO_TEST_DIRS := $(shell \
	find . -name "*_test.go" -not -path "./vendor/*" | \
	xargs -I {} dirname {}  | \
	uniq)

# Aliases
all: configuration build
b: build
t: test
v: version

# TESTING ----------------------------------------------------------------------
test: test_richgo

test_coverage_func:
	@go tool cover -func=coverage.out

test_coverage_html:
	@go tool cover -html=coverage.out

test_golang:
	@go test -v ./... -cover -coverprofile=coverage.out #-bench=.

test_gotest:
	@gotest -v ./... -cover -coverprofile=coverage.out #-bench=.

test_richgo:
	@richgo test -v ./... -cover -coverprofile=coverage.out #-bench=.
