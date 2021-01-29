# Source this file to default to python2 in your local environment without changing the system
mkdir -p /tmp/python2-default
ln -sf $(which python2) /tmp/python2-default/python
export PATH="/tmp/python2-default:${PATH:-}"
echo "Using Python2 by default in this environment"
