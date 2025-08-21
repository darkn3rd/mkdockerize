
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
vagrant up
vagrant ssh 
# run commands from install_docker.sh
cd /vagrant
# run through steps above
./mkdockerize.sh build
./mkdockerize.sh produce ./test > test.tgz
cat test.tgz | ./mkdockerize.sh serve
```