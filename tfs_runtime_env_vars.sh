export TFS_IMAGE_TAG="dev"
export TFS_K8S_NAMESPACE="tfs"
export TFS_K8S_HOSTNAME="192.168.2.25"
export TFS_SKIP_BUILD="NO"

# Lite-Configuration Whitelist (Rule 11)
export TFS_COMPONENTS="context device service slice pathcomp nbi webui interdomain"

# Registry
export TFS_REGISTRY_IMAGES="localhost:32000/tfs/"

# Database (CockroachDB Baseline)
export CRDB_NAMESPACE="crdb"
export CRDB_DATABASE="tfs"
export CRDB_USERNAME="root"
export CRDB_PASSWORD="root"
export CRDB_SSLMODE="disable"

# NATS
export NATS_NAMESPACE="nats"
