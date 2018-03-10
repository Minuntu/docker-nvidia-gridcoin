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

`docker exec gridcoin gridcoinresearchd -conf=/data/girdcoinresearchd.conf execute advertisebeacon`

### Get receiving address

`docker exec gridcoin gridcoinresearchd -conf=/data/girdcoinresearchd.conf getaccountaddress 0`

### Get balance

`docker exec gridcoin gridcoinresearchd -conf=/data/girdcoinresearchd.conf getbalance`

### Send funds

`docker exec gridcoin gridcoinresearchd -conf=/data/girdcoinresearchd.conf sendtoaddress S7tpn1355Ju1JbSJ3arH7SRZrUR6Y5KNNv 5`

### Protecting wallet with a passphrase

`docker exec gridcoin gridcoinresearchd -conf=/data/girdcoinresearchd.conf walletlock`

### Unlocking wallet (for 2 minutes)

`docker exec gridcoin gridcoinresearchd -conf=/data/girdcoinresearchd.conf walletpassphrase xxxxx 120`
