#!/bin/bash

SELF_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
SELF_PATH_DIR="$(dirname $SELF_PATH)"

EXATASK_RC_DIR=~/.exatask
EXATASK_RC=$EXATASK_RC_DIR/.exataskrc

source $EXATASK_RC
source $EXATASK_INFRA_SETUP_DIR/core/common.sh

export_core_variables()
{
  put_info "Exporting ExaTask Migration Databank variables"

  START="## >>> Exatask Migration Databank variables"
  END="## <<< Exatask Migration Databank variables"

  CONTENT=$(cat <<EOF
$START

export EXATASK_MIGRATION_DATABANK_DIR=$EXATASK_DIR/migration-databank

$END
EOF
)

  add_to_file_marker $EXATASK_DATABANK_RC "$START" "$END" "$CONTENT"
  source $EXATASK_RC
}

export_core_variables
