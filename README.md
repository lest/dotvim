Setup:

```
git clone https://github.com/lest/dotvim.git ~/.vim
cd ~/.vim
git submodule update --init
ln -s ~/.vim/vimrc ~/.vimrc
```

Update:

```
cd ~/.vim
git pull origin master
git submodule update --init
```

Update plugins:

```
cd ~/.vim
for repo in bundle/*; do echo "Updating $repo"; cd $repo; git fetch origin && git reset --hard origin/master; cd -; done
```
