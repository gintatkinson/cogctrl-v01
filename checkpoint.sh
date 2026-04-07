#!/bin/bash
# CogCtrl Sovereign Checkpoint & Recovery Script (v1.0)
# Mandated by Rule 10 and Rule 14 of the Sovereign Bible.

set -e

TRACKER="ops/SOP_TRACKER.json"
REGISTRY="ops/verification_registry.json"
LEDGER="ops/SUCCESSION_LEDGER.md"

function get_json_val() {
  python3 -c "import json; print(json.load(open('$1'))['$2']['$3'])"
}

function get_tracker_val() {
  python3 -c "import json; print(json.load(open('$1'))['$2'])"
}

# 1. Load Current State
SOP_ID=$(get_tracker_val "$TRACKER" "current_sop_id")
STATUS=$(get_tracker_val "$TRACKER" "mission_status")

echo ">>> [SOVEREIGN CHECKPOINT] Current SOP: $SOP_ID"
echo ">>> [SOVEREIGN CHECKPOINT] Mission Status: $STATUS"

# 2. Run Verification
CMD=$(get_json_val "$REGISTRY" "$SOP_ID" "command")
EXPECTED=$(get_json_val "$REGISTRY" "$SOP_ID" "expected_result")

echo ">>> [VERIFY] Executing: $CMD"
RESULT=$($CMD 2>&1 || true)

if echo "$RESULT" | grep -q "$EXPECTED"; then
  echo ">>> [SUCCESS] Verification Passed for $SOP_ID."
  
  # 3. Update Persistence
  TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  python3 -c "import json; d=json.load(open('$TRACKER')); d['last_verified_at']='$TIMESTAMP'; json.dump(d, open('$TRACKER', 'w'), indent=2)"
  
  echo ">>> [PERSISTENCE] Logging to Succession Ledger..."
  echo -e "\n---\n## [Checkpoint] $SOP_ID Verified\n**Time**: $TIMESTAMP\n**Result**: PASSED\n" >> "$LEDGER"
  
  # 4. Push to GitHub
  echo ">>> [GIT] Pushing Checkpoint Commit..."
  git add "$TRACKER" "$LEDGER"
  git commit -m "CHECKPOINT: $SOP_ID VERIFIED AT $TIMESTAMP" || echo "No changes to commit."
  git push origin main || echo "Git push failed. Repository may be out of sync."
  
  echo ">>> [SOVEREIGN RECOVERY] Persistent state anchored to GitHub."
else
  echo ">>> [FAILURE] Verification Failed for $SOP_ID!"
  echo ">>> [FAIL] Result: $RESULT"
  echo ">>> [FAIL] Expected: $EXPECTED"
  echo ">>> [HALT] CRITICAL BREACH! Stop all operations and perform Forensic Audit."
  exit 1
fi
