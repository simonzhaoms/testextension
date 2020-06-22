#! /bin/bash -

echo "Install Azure CLI ..."
sudo apt-get update > /dev/null || exit
sudo apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg \
    > /dev/null || exit
curl -sL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
    > /dev/null || exit
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" \
    | sudo tee /etc/apt/sources.list.d/azure-cli.list > /dev/null || exit
sudo apt-get update > /dev/null || exit
sudo apt-get install -y azure-cli > /dev/null || exit

echo "Install Python and pip ..."
sudo apt-get -y install python3 python3-pip > /dev/null || exit
pip3 install --upgrade pip > /dev/null || exit
pip3 install setuptools > /dev/null || exit

echo "Install DataBricks CLI ..."
pip3 install databricks-cli > /dev/null || exit

echo "Install jq ..."
sudo apt-get install -y jq  > /dev/null || exit
