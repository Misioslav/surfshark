# Surfshark VPN

It is based on OpenVPN connection
It also requires active Surfshark account to connect to the servers.
# Usage

`USER` and `PASS` can be found here [https://account.surfshark.com/setup/manual](https://account.surfshark.com/setup/manual) at the bottom of the page.

## Docker

```
docker run \
	  --detach=true \
	  --init \
	  --cap-add=NET_ADMIN \
	  --device=/dev/net/tun \
	  --env=USER=USER \
	  --env=PASS=PASS \
	  --env=LOCATION=LOCATION \ #might be left empty in that case will take first 64 servers it finds otherwise will try to locate files for location
	  misioslav/surfshark:latest
```
## Docker Compose
```
example:
  image: maintainer/example:version
  container_name: example
  network_mode: service:surfshark
  depends_on:
    - surfshark

surfshark:
  image: misioslav/surfshark:latest
  init: true
  network_mode: bridge
  container_name: surfshark
  restart: unless-stopped
  cap_add:
    - NET_ADMIN
  devices:
    - /dev/net/tun
  environment:
   - USER=${USER}
   - PASS=${PASS}
   - LOCATION=${LOCATION} #might be left empty in that case will take first 64 servers it finds otherwise will try to locate files for location
```
# LOCATION
Location should be set as `--env=LOCATION=us` or for docker-compose `- LOCATION=us`, script will look for all servers for us and use them in random order

```
ae-dub
al-tia
at-vie
au-adl
au-bne
au-mel
au-per
au-syd
az-bak
ba-sjj
be-bru
bg-sof
br-sao
ca-mon
ca-tor
ca-van
ch-zur
cl-san
co-bog
cr-sjn
cy-nic
cz-prg
de-ber
de-fra-st001
de-fra-st002
de-fra-st003
de-fra
de-muc
de-nue
dk-cph
ee-tll
es-bcn
es-mad
es-vlc
fi-hel
fr-bod
fr-mrs
fr-par
gr-ath
hk-hkg
hr-zag
hu-bud
id-jak
ie-dub
il-tlv
in-chn
in-idr
in-mum
is-rkv
it-mil
it-rom
jp-tok-st001
jp-tok-st002
jp-tok-st003
jp-tok-st004
jp-tok-st005
jp-tok-st006
jp-tok-st007
jp-tok
kr-seo
kz-ura
lu-ste
lv-rig
ly-tip
md-chi
mk-skp
my-kul
ng-lag
nl-ams-st001
nl-ams
no-osl
nz-akl
ph-mnl
pl-gdn
pl-waw
pt-lis
pt-lou
pt-opo
py-asu
ro-buc
rs-beg
ru-mos
ru-spt
se-sto
sg-sng-st001
sg-sng-st002
sg-sng-st003
sg-sng-st004
sg-sng
si-lju
sk-bts
th-bkk
tr-bur
tw-tai
ua-iev
uk-gla
uk-lon-st001
uk-lon-st002
uk-lon-st003
uk-lon-st004
uk-lon-st005
uk-lon
uk-man
us-atl
us-bdn
us-bos
us-buf
us-chi
us-clt
us-dal
us-den
us-dtw
us-hou
us-kan
us-las
us-lax
us-ltm
us-mia
us-mnz
us-nyc-st001
us-nyc-st002
us-nyc-st003
us-nyc-st004
us-nyc-st005
us-nyc
us-orl
us-phx
us-sea
us-sfo
us-slc
us-stl
us-tpa
vn-hcm
za-jnb
```
