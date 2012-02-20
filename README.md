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