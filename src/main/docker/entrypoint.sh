#!/bin/bash
set -e
set -x
case $1 in
atlas-version)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-version/
  $1
  ;;
atlas-create-*)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-create-confluence-plugin/
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-create-jira-plugin/
  $@
  ;;
atlas-clean)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-clean/
  (cd /plugin; $@)
  ;;
atlas-clover)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-clover/
  (cd /plugin; $@)
  ;;
atlas-compile)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-compile/
  (cd /plugin; $@)
  ;;
atlas-debug)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-debug/ 
  (cd /plugin; $@)
  ;;
atlas-install-plugin)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-install-plugin/
  (cd /plugin; $@)
  ;;
atlas-integration-test)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-integration-test/
  (cd /plugin; $@)
  ;;
atlas-package)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-package/
  (cd /plugin; $@)
  ;;
atlas-release)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-release/
  (cd /plugin; $@)
  ;;
atlas-release-rollback)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-release-rollback/ 
  (cd /plugin; $@)
  ;;
atlas-run)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-run/
  (cd /plugin; $@)
  ;;
atlas-run-standalone)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-run-standalone/
  (cd /plugin; $@)
  ;;
atlas-unit-test)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-unit-test/
  (cd /plugin; $@)
  ;;
atlas-update)
  # https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-update/
  (cd /plugin; $@)
  ;;
shell)
  shift
  /bin/bash $@
  ;;
*)
  false
  ;;
esac