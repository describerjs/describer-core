Initial:

git remote add -f describer-localStorage_remote https://github.com/describerjs/describer-localStorage.git

git subtree add --prefix=joinmedia/js/describer-localStorage describer-localStorage_remote/develop --squash




push subtree:

git subtree push --prefix=joinmedia/js/describer-localStorage describer-localStorage_remote develop --squash


pull subtree:
git subtree pull --prefix=joinmedia/js/describer-localStorage describer-localStorage_remote develop --squash


diff changes remote-develop < - > subtree on develop
git diff describer-localStorage_remote/develop develop:joinmedia/js/describer-localStorage


!!!!!!!!!!!!!!!!!!!!
1. pull
2. push
3. pull
!!!!!!!!!!!!!!!!!!!