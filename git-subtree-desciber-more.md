Initial:

git remote add -f describer-more_remote https://bitbucket.org/joinmedia-repos/describer-more.git

git subtree add --prefix=joinmedia/js/describer-more describer-more_remote/develop --squash



push subtree:

git subtree push --prefix=joinmedia/js/describer-more describer-more_remote develop --squash




pull subtree:

git subtree pull --prefix=joinmedia/js/describer-more describer-more_remote develop --squash




diff changes remote-develop < - > subtree on develop:

git diff describer-more_remote/develop develop:joinmedia/js/describer-more


!!!!!!!!!!!!!!!!!!!!
1. pull
2. push
3. pull
!!!!!!!!!!!!!!!!!!!!