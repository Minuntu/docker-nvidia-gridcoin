# Gridcoin master node docker file

## Minimal config

`BAM_URL` : Url for the Boinc account manager ( boincstats, grcpool, ... )

`BAM_USERNAME` : Your BAM username

`BAM_PASSWORD` : Your BAM password

## Run ( with nvidia Cuda, see https://github.com/NVIDIA/nvidia-docker )

`docker run --name gridcoin --runtime=nvidia -ti --rm -e BAM_USERNAME="xxxx" -e BAM_PASSWORD="xxx" -e BAM_URL="http://xxxx" -v grcdata:/data minuntu/nvidia-gridcoin`

WARNING: always use a volume, otherwise you'll lose your wallet, blockchain and boinc data !

## Usage

### Send beacon

`docker exec gridcoin gridcoinresearchd -conf=/data/gridcoinresearchd.conf execute advertisebeacon`

### Get receiving address

`docker exec gridcoin gridcoinresearchd -conf=/data/gridcoinresearchd.conf getaccountaddress 0`

### Get balance

`docker exec gridcoin gridcoinresearchd -conf=/data/gridcoinresearchd.conf getbalance`

### Send funds

`docker exec gridcoin gridcoinresearchd -conf=/data/gridcoinresearchd.conf sendtoaddress S7tpn1355Ju1JbSJ3arH7SRZrUR6Y5KNNv 5`

### Protecting wallet with a passphrase

`docker exec gridcoin gridcoinresearchd -conf=/data/gridcoinresearchd.conf encryptwallet xxxxx`

### Unlocking wallet (for 2 minutes)

`docker exec gridcoin gridcoinresearchd -conf=/data/gridcoinresearchd.conf walletpassphrase xxxxx 120`

## Boinc only node

There's a docker image available for Boinc only as well : https://github.com/Minuntu/docker-nvidia-boinc

If you add any project to a solo image through your account manager, 
make sure you also enable your project for your gridcoin+boinc node, 
otherwise gridcoin won't detect ( and pay you ) for it.

You can tick the "No new work" option in the project configuration if you don't want your boinc master to crunch data for a specific project but still detect it.
