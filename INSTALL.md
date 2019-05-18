cd /tmp
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
sudo tar -xvf go1.12.5.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
source ~/.profile
make
#GOOS=darwin GOARCH=amd64
#GOOS=linux GOARCH=386
#GOOS=linux GOARCH=amd64
#GOOS=linux GOARCH=arm
#GOOS=linux GOARCH=arm64
#GOOS=linux GOARCH=mips
#GOOS=linux GOARCH=mips
#GOOS=linux GOARCH=mipsle
#GOOS=linux GOARCH=mips64
#GOOS=linux GOARCH=mips64le
#GOOS=freebsd GOARCH=386
#GOOS=freebsd GOARCH=amd64
#GOOS=windows GOARCH=386
#GOOS=windows GOARCH=amd64
