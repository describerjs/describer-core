Initial:

git remote add -f describer-core_remote https://github.com/describerjs/describer-core.git

git subtree add --prefix=joinmedia/js/describer-core describer-core_remote/develop --squash




push subtree:

git subtree push --prefix=joinmedia/js/describer-core describer-core_remote develop --squash


pull subtree:
git subtree pull --prefix=joinmedia/js/describer-core describer-core_remote develop --squash


diff changes remote-develop < - > subtree on develop
git diff describer-core_remote/develop develop:joinmedia/js/describer-core


!!!!!!!!!!!!!!!!!!!!
1. pull
2. push
3. pull
!!!!!!!!!!!!!!!!!!!