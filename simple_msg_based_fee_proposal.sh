#!/bin/bash
PROVENANCE_DEV_DIR=~/code/provenance
MSG_TYPE=/cosmos.bank.v1beta1.MsgSend
PROPOSAL_ID=1

echo "ADDING PROPOSAL RIGHT NOW"
${PROVENANCE_DEV_DIR}/build/provenanced tx msgfees proposal add "adding" "adding msgsend fee"  10000000000nhash --msg-type "${MSG_TYPE}" --additional-fee 2000000000nhash  --from validator --yes -t --home ${PROVENANCE_DEV_DIR}/build/run/provenanced --fees 1000000000nhash --chain-id testing --keyring-backend test -o json | jq
echo "VOTING ON PROPOSAL"
${PROVENANCE_DEV_DIR}/build/provenanced tx gov vote ${PROPOSAL_ID} yes --from validator --yes -t --home ${PROVENANCE_DEV_DIR}/build/run/provenanced --fees 1000000000nhash --chain-id testing --keyring-backend test -o json | jq
echo "AFTER VOTING"