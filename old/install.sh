rm -rfv venv # kill existing version if it already exists
# setup venv
pip install virtualenv
virtualenv venv
source venv/bin/activate
python --version
echo "Python directory: $(which python)"

# install reqs
pip install imageio
pip install pathlib
pip install numpy
