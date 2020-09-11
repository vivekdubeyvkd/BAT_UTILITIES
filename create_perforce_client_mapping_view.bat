set P4USER="vivek"
set P4PASSWD=%P4PASS%
set P4CLIENT=my_client_name
set ROOT_DIR=C:\\
set PERFORCE_SOURCE_REPO_URL=//depot/my_repo
set PERFORCE_DEST_REPO_PATH=%P4CLIENT%/depot/my_repo

echo %P4PASSWD%|p4 login
p4 info

p4 client -d %P4CLIENT%
p4 --field "Client=%P4CLIENT%" --field "Root=%ROOT_DIR%" --field "View=%PERFORCE_SOURCE_REPO_URL%/... //%PERFORCE_DEST_REPO_PATH%/..." client -o > client.config
type client.config | p4 client -i
del /f client.config
