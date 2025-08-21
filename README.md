
## Example Usage

### Build Image

```bash
./mkdocerize.sh build
```

### Server Archive

```bash
# Produce an archive
./mkdockerize.sh produce ./test > test.tgz

# Serve the archive
cat test.tgz | ./mkdockerize.sh serve 
```

### Test on local web browser

* http://localhost:8000/


### Build Environment

This requires Docker Engine and ability to run `docker` commands. 

A Vagrant environment is included.  If you like to use this (tested on MacOS Intel), you can run:

```bash
# download Ubuntu 22.04 and launch VM
vagrant up
# log into Ubuntu system
vagrant ssh 
# IMPORTANT: Install Docker
#   See: install_docker.sh

# Manually Test 
cd /vagrant
# run through steps above
./mkdockerize.sh build
./mkdockerize.sh produce ./test > test.tgz
cat test.tgz | ./mkdockerize.sh serve

# Testing CI workflow
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
cd /vagrant
~/bin/act
```