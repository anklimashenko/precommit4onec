@ECHO OFF
call del "*.ospx"
call opm build . -mf ./packagedef -out .
call opm install -f precommit4onec-1.0.9.ospx
