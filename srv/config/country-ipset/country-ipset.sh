#!/bin/bash
# ------------------------------------------------------------------
# [Casey Benefield] IPSET Country Blocker
#          Block every country except USA with IPSET
# Dependencies: ipset
# Comments: In my setup, I have a /srv/ NFS share between all servers, for common configuration that is applied.
# ------------------------------------------------------------------

VERSION=0.1.0
SUBJECT=ipset-country-block-allbutus

# Create Structure
mkdir -p /src/config/ipset

# Clear out existing files
rm /srv/config/country-ipset/*.txt

# Get Country IP Blocks
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/af-aggregated.zone -O /srv/config/country-ipset/ipset-AF-1.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ax-aggregated.zone -O /srv/config/country-ipset/ipset-AX-2.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/al-aggregated.zone -O /srv/config/country-ipset/ipset-AL-3.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/dz-aggregated.zone -O /srv/config/country-ipset/ipset-DZ-4.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/as-aggregated.zone -O /srv/config/country-ipset/ipset-AS-5.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ad-aggregated.zone -O /srv/config/country-ipset/ipset-AD-6.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ao-aggregated.zone -O /srv/config/country-ipset/ipset-AO-7.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ai-aggregated.zone -O /srv/config/country-ipset/ipset-AI-8.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/aq-aggregated.zone -O /srv/config/country-ipset/ipset-AQ-9.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ag-aggregated.zone -O /srv/config/country-ipset/ipset-AG-10.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ar-aggregated.zone -O /srv/config/country-ipset/ipset-AR-11.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/am-aggregated.zone -O /srv/config/country-ipset/ipset-AM-12.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/aw-aggregated.zone -O /srv/config/country-ipset/ipset-AW-13.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/au-aggregated.zone -O /srv/config/country-ipset/ipset-AU-14.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/at-aggregated.zone -O /srv/config/country-ipset/ipset-AT-15.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/az-aggregated.zone -O /srv/config/country-ipset/ipset-AZ-16.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bs-aggregated.zone -O /srv/config/country-ipset/ipset-BS-17.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bh-aggregated.zone -O /srv/config/country-ipset/ipset-BH-18.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bd-aggregated.zone -O /srv/config/country-ipset/ipset-BD-19.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bb-aggregated.zone -O /srv/config/country-ipset/ipset-BB-20.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/by-aggregated.zone -O /srv/config/country-ipset/ipset-BY-21.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/be-aggregated.zone -O /srv/config/country-ipset/ipset-BE-22.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bz-aggregated.zone -O /srv/config/country-ipset/ipset-BZ-23.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bj-aggregated.zone -O /srv/config/country-ipset/ipset-BJ-24.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bm-aggregated.zone -O /srv/config/country-ipset/ipset-BM-25.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bt-aggregated.zone -O /srv/config/country-ipset/ipset-BT-26.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bo-aggregated.zone -O /srv/config/country-ipset/ipset-BO-27.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ba-aggregated.zone -O /srv/config/country-ipset/ipset-BA-28.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bw-aggregated.zone -O /srv/config/country-ipset/ipset-BW-29.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/br-aggregated.zone -O /srv/config/country-ipset/ipset-BR-30.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/io-aggregated.zone -O /srv/config/country-ipset/ipset-IO-31.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bn-aggregated.zone -O /srv/config/country-ipset/ipset-BN-32.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bg-aggregated.zone -O /srv/config/country-ipset/ipset-BG-33.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bf-aggregated.zone -O /srv/config/country-ipset/ipset-BF-34.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/bi-aggregated.zone -O /srv/config/country-ipset/ipset-BI-35.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/kh-aggregated.zone -O /srv/config/country-ipset/ipset-KH-36.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cm-aggregated.zone -O /srv/config/country-ipset/ipset-CM-37.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ca-aggregated.zone -O /srv/config/country-ipset/ipset-CA-38.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cv-aggregated.zone -O /srv/config/country-ipset/ipset-CV-39.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ky-aggregated.zone -O /srv/config/country-ipset/ipset-KY-40.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cf-aggregated.zone -O /srv/config/country-ipset/ipset-CF-41.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/td-aggregated.zone -O /srv/config/country-ipset/ipset-TD-42.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cl-aggregated.zone -O /srv/config/country-ipset/ipset-CL-43.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cn-aggregated.zone -O /srv/config/country-ipset/ipset-CN-44.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cc-aggregated.zone -O /srv/config/country-ipset/ipset-CC-45.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/co-aggregated.zone -O /srv/config/country-ipset/ipset-CO-46.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/km-aggregated.zone -O /srv/config/country-ipset/ipset-KM-47.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cg-aggregated.zone -O /srv/config/country-ipset/ipset-CG-48.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cd-aggregated.zone -O /srv/config/country-ipset/ipset-CD-49.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ck-aggregated.zone -O /srv/config/country-ipset/ipset-CK-50.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cr-aggregated.zone -O /srv/config/country-ipset/ipset-CR-51.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ci-aggregated.zone -O /srv/config/country-ipset/ipset-CI-52.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/hr-aggregated.zone -O /srv/config/country-ipset/ipset-HR-53.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cu-aggregated.zone -O /srv/config/country-ipset/ipset-CU-54.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cy-aggregated.zone -O /srv/config/country-ipset/ipset-CY-55.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/cz-aggregated.zone -O /srv/config/country-ipset/ipset-CZ-56.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/dk-aggregated.zone -O /srv/config/country-ipset/ipset-DK-57.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/dj-aggregated.zone -O /srv/config/country-ipset/ipset-DJ-58.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/dm-aggregated.zone -O /srv/config/country-ipset/ipset-DM-59.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/do-aggregated.zone -O /srv/config/country-ipset/ipset-DO-60.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ec-aggregated.zone -O /srv/config/country-ipset/ipset-EC-61.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/eg-aggregated.zone -O /srv/config/country-ipset/ipset-EG-62.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sv-aggregated.zone -O /srv/config/country-ipset/ipset-SV-63.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gq-aggregated.zone -O /srv/config/country-ipset/ipset-GQ-64.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/er-aggregated.zone -O /srv/config/country-ipset/ipset-ER-65.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ee-aggregated.zone -O /srv/config/country-ipset/ipset-EE-66.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/et-aggregated.zone -O /srv/config/country-ipset/ipset-ET-67.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/fk-aggregated.zone -O /srv/config/country-ipset/ipset-MA-68.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/fo-aggregated.zone -O /srv/config/country-ipset/ipset-FO-69.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/fj-aggregated.zone -O /srv/config/country-ipset/ipset-FJ-70.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/fi-aggregated.zone -O /srv/config/country-ipset/ipset-FI-71.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/fr-aggregated.zone -O /srv/config/country-ipset/ipset-FR-72.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gf-aggregated.zone -O /srv/config/country-ipset/ipset-GF-73.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pf-aggregated.zone -O /srv/config/country-ipset/ipset-PF-74.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ga-aggregated.zone -O /srv/config/country-ipset/ipset-GA-75.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gm-aggregated.zone -O /srv/config/country-ipset/ipset-GM-76.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ge-aggregated.zone -O /srv/config/country-ipset/ipset-GE-77.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/de-aggregated.zone -O /srv/config/country-ipset/ipset-DE-78.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gh-aggregated.zone -O /srv/config/country-ipset/ipset-GH-79.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gi-aggregated.zone -O /srv/config/country-ipset/ipset-GI-80.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gr-aggregated.zone -O /srv/config/country-ipset/ipset-GR-81.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gl-aggregated.zone -O /srv/config/country-ipset/ipset-GL-82.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gd-aggregated.zone -O /srv/config/country-ipset/ipset-GD-83.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gp-aggregated.zone -O /srv/config/country-ipset/ipset-GP-84.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gu-aggregated.zone -O /srv/config/country-ipset/ipset-GU-85.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gt-aggregated.zone -O /srv/config/country-ipset/ipset-GT-86.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gn-aggregated.zone -O /srv/config/country-ipset/ipset-GN-87.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gw-aggregated.zone -O /srv/config/country-ipset/ipset-GW-88.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gy-aggregated.zone -O /srv/config/country-ipset/ipset-GY-89.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ht-aggregated.zone -O /srv/config/country-ipset/ipset-HT-90.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/va-aggregated.zone -O /srv/config/country-ipset/ipset-VA-91.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/hn-aggregated.zone -O /srv/config/country-ipset/ipset-HN-92.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/hk-aggregated.zone -O /srv/config/country-ipset/ipset-HK-93.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/hu-aggregated.zone -O /srv/config/country-ipset/ipset-HU-94.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/is-aggregated.zone -O /srv/config/country-ipset/ipset-IS-95.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/in-aggregated.zone -O /srv/config/country-ipset/ipset-IN-96.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/id-aggregated.zone -O /srv/config/country-ipset/ipset-ID-97.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ir-aggregated.zone -O /srv/config/country-ipset/ipset-IR-98.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/iq-aggregated.zone -O /srv/config/country-ipset/ipset-IQ-99.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ie-aggregated.zone -O /srv/config/country-ipset/ipset-IE-100.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/im-aggregated.zone -O /srv/config/country-ipset/ipset-IM-101.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/il-aggregated.zone -O /srv/config/country-ipset/ipset-IL-102.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/it-aggregated.zone -O /srv/config/country-ipset/ipset-IT-103.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/jm-aggregated.zone -O /srv/config/country-ipset/ipset-JM-104.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/jp-aggregated.zone -O /srv/config/country-ipset/ipset-JP-105.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/je-aggregated.zone -O /srv/config/country-ipset/ipset-JE-106.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/jo-aggregated.zone -O /srv/config/country-ipset/ipset-JO-107.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/kz-aggregated.zone -O /srv/config/country-ipset/ipset-KZ-108.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ke-aggregated.zone -O /srv/config/country-ipset/ipset-KE-109.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ki-aggregated.zone -O /srv/config/country-ipset/ipset-KI-110.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/kp-aggregated.zone -O /srv/config/country-ipset/ipset-KP-111.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/kr-aggregated.zone -O /srv/config/country-ipset/ipset-KR-112.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/kw-aggregated.zone -O /srv/config/country-ipset/ipset-KW-113.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/kg-aggregated.zone -O /srv/config/country-ipset/ipset-KG-114.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/la-aggregated.zone -O /srv/config/country-ipset/ipset-LA-115.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/lv-aggregated.zone -O /srv/config/country-ipset/ipset-LV-116.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/lb-aggregated.zone -O /srv/config/country-ipset/ipset-LB-117.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ls-aggregated.zone -O /srv/config/country-ipset/ipset-LS-118.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/lr-aggregated.zone -O /srv/config/country-ipset/ipset-LR-119.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ly-aggregated.zone -O /srv/config/country-ipset/ipset-LY-120.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/li-aggregated.zone -O /srv/config/country-ipset/ipset-LI-121.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/lt-aggregated.zone -O /srv/config/country-ipset/ipset-LT-122.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/lu-aggregated.zone -O /srv/config/country-ipset/ipset-LU-123.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mo-aggregated.zone -O /srv/config/country-ipset/ipset-MO-124.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mk-aggregated.zone -O /srv/config/country-ipset/ipset-MK-125.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mg-aggregated.zone -O /srv/config/country-ipset/ipset-MG-126.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mw-aggregated.zone -O /srv/config/country-ipset/ipset-MW-127.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/my-aggregated.zone -O /srv/config/country-ipset/ipset-MY-128.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mv-aggregated.zone -O /srv/config/country-ipset/ipset-MV-129.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ml-aggregated.zone -O /srv/config/country-ipset/ipset-ML-130.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mt-aggregated.zone -O /srv/config/country-ipset/ipset-MT-131.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mh-aggregated.zone -O /srv/config/country-ipset/ipset-MH-132.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mq-aggregated.zone -O /srv/config/country-ipset/ipset-MQ-133.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mr-aggregated.zone -O /srv/config/country-ipset/ipset-MR-134.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mu-aggregated.zone -O /srv/config/country-ipset/ipset-MU-135.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/yt-aggregated.zone -O /srv/config/country-ipset/ipset-YT-136.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mx-aggregated.zone -O /srv/config/country-ipset/ipset-MX-137.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/fm-aggregated.zone -O /srv/config/country-ipset/ipset-FM-138.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/md-aggregated.zone -O /srv/config/country-ipset/ipset-MD-139.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mc-aggregated.zone -O /srv/config/country-ipset/ipset-MC-140.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mn-aggregated.zone -O /srv/config/country-ipset/ipset-MN-141.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/me-aggregated.zone -O /srv/config/country-ipset/ipset-ME-142.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ms-aggregated.zone -O /srv/config/country-ipset/ipset-MS-143.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ma-aggregated.zone -O /srv/config/country-ipset/ipset-MA-144.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mz-aggregated.zone -O /srv/config/country-ipset/ipset-MZ-145.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mm-aggregated.zone -O /srv/config/country-ipset/ipset-MM-146.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/na-aggregated.zone -O /srv/config/country-ipset/ipset-NA-147.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/nr-aggregated.zone -O /srv/config/country-ipset/ipset-NR-148.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/np-aggregated.zone -O /srv/config/country-ipset/ipset-NP-149.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/nl-aggregated.zone -O /srv/config/country-ipset/ipset-NL-150.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/nc-aggregated.zone -O /srv/config/country-ipset/ipset-NC-151.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/nz-aggregated.zone -O /srv/config/country-ipset/ipset-NZ-152.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ni-aggregated.zone -O /srv/config/country-ipset/ipset-NI-153.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ne-aggregated.zone -O /srv/config/country-ipset/ipset-NE-154.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ng-aggregated.zone -O /srv/config/country-ipset/ipset-NG-155.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/nu-aggregated.zone -O /srv/config/country-ipset/ipset-NU-156.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/nf-aggregated.zone -O /srv/config/country-ipset/ipset-NF-157.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/mp-aggregated.zone -O /srv/config/country-ipset/ipset-MP-158.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/no-aggregated.zone -O /srv/config/country-ipset/ipset-NO-159.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/om-aggregated.zone -O /srv/config/country-ipset/ipset-OM-160.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pk-aggregated.zone -O /srv/config/country-ipset/ipset-PK-161.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pw-aggregated.zone -O /srv/config/country-ipset/ipset-PW-162.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ps-aggregated.zone -O /srv/config/country-ipset/ipset-PS-163.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pa-aggregated.zone -O /srv/config/country-ipset/ipset-PA-164.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pg-aggregated.zone -O /srv/config/country-ipset/ipset-PG-165.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/py-aggregated.zone -O /srv/config/country-ipset/ipset-PY-166.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pe-aggregated.zone -O /srv/config/country-ipset/ipset-PE-167.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ph-aggregated.zone -O /srv/config/country-ipset/ipset-PH-168.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pl-aggregated.zone -O /srv/config/country-ipset/ipset-PL-169.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pt-aggregated.zone -O /srv/config/country-ipset/ipset-PT-170.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pr-aggregated.zone -O /srv/config/country-ipset/ipset-PR-171.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/qa-aggregated.zone -O /srv/config/country-ipset/ipset-QA-172.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/re-aggregated.zone -O /srv/config/country-ipset/ipset-RE-173.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ro-aggregated.zone -O /srv/config/country-ipset/ipset-RO-174.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ru-aggregated.zone -O /srv/config/country-ipset/ipset-RU-175.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/rw-aggregated.zone -O /srv/config/country-ipset/ipset-RW-176.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/kn-aggregated.zone -O /srv/config/country-ipset/ipset-KN-177.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/lc-aggregated.zone -O /srv/config/country-ipset/ipset-LC-178.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/pm-aggregated.zone -O /srv/config/country-ipset/ipset-PM-179.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/vc-aggregated.zone -O /srv/config/country-ipset/ipset-VC-180.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ws-aggregated.zone -O /srv/config/country-ipset/ipset-WS-181.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sm-aggregated.zone -O /srv/config/country-ipset/ipset-SM-182.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/st-aggregated.zone -O /srv/config/country-ipset/ipset-ST-183.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sa-aggregated.zone -O /srv/config/country-ipset/ipset-SA-184.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sn-aggregated.zone -O /srv/config/country-ipset/ipset-SN-185.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/rs-aggregated.zone -O /srv/config/country-ipset/ipset-RS-186.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sc-aggregated.zone -O /srv/config/country-ipset/ipset-SC-187.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sl-aggregated.zone -O /srv/config/country-ipset/ipset-SL-188.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sg-aggregated.zone -O /srv/config/country-ipset/ipset-SG-189.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sk-aggregated.zone -O /srv/config/country-ipset/ipset-SK-190.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/si-aggregated.zone -O /srv/config/country-ipset/ipset-SI-191.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sb-aggregated.zone -O /srv/config/country-ipset/ipset-SB-192.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/so-aggregated.zone -O /srv/config/country-ipset/ipset-SO-193.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/za-aggregated.zone -O /srv/config/country-ipset/ipset-ZA-194.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/es-aggregated.zone -O /srv/config/country-ipset/ipset-ES-195.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/lk-aggregated.zone -O /srv/config/country-ipset/ipset-LK-196.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sd-aggregated.zone -O /srv/config/country-ipset/ipset-SD-197.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sr-aggregated.zone -O /srv/config/country-ipset/ipset-SR-198.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sz-aggregated.zone -O /srv/config/country-ipset/ipset-SZ-199.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/se-aggregated.zone -O /srv/config/country-ipset/ipset-SE-200.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ch-aggregated.zone -O /srv/config/country-ipset/ipset-CH-201.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/sy-aggregated.zone -O /srv/config/country-ipset/ipset-SY-202.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tw-aggregated.zone -O /srv/config/country-ipset/ipset-TW-203.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tj-aggregated.zone -O /srv/config/country-ipset/ipset-TJ-204.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tz-aggregated.zone -O /srv/config/country-ipset/ipset-TZ-205.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/th-aggregated.zone -O /srv/config/country-ipset/ipset-TH-206.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tl-aggregated.zone -O /srv/config/country-ipset/ipset-TL-207.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tg-aggregated.zone -O /srv/config/country-ipset/ipset-TG-208.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tk-aggregated.zone -O /srv/config/country-ipset/ipset-TK-209.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/to-aggregated.zone -O /srv/config/country-ipset/ipset-TO-210.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tt-aggregated.zone -O /srv/config/country-ipset/ipset-TT-211.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tn-aggregated.zone -O /srv/config/country-ipset/ipset-TN-212.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tr-aggregated.zone -O /srv/config/country-ipset/ipset-TR-213.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tm-aggregated.zone -O /srv/config/country-ipset/ipset-TM-214.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tc-aggregated.zone -O /srv/config/country-ipset/ipset-TC-215.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/tv-aggregated.zone -O /srv/config/country-ipset/ipset-TV-216.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ug-aggregated.zone -O /srv/config/country-ipset/ipset-UG-217.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ua-aggregated.zone -O /srv/config/country-ipset/ipset-UA-218.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ae-aggregated.zone -O /srv/config/country-ipset/ipset-AE-219.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/gb-aggregated.zone -O /srv/config/country-ipset/ipset-GB-220.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/um-aggregated.zone -O /srv/config/country-ipset/ipset-UM-221.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/uy-aggregated.zone -O /srv/config/country-ipset/ipset-UY-222.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/uz-aggregated.zone -O /srv/config/country-ipset/ipset-UZ-223.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/vu-aggregated.zone -O /srv/config/country-ipset/ipset-VU-224.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ve-aggregated.zone -O /srv/config/country-ipset/ipset-VE-225.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/vn-aggregated.zone -O /srv/config/country-ipset/ipset-VN-226.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/vg-aggregated.zone -O /srv/config/country-ipset/ipset-VG-227.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/vi-aggregated.zone -O /srv/config/country-ipset/ipset-VI-228.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/wf-aggregated.zone -O /srv/config/country-ipset/ipset-WF-229.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/ye-aggregated.zone -O /srv/config/country-ipset/ipset-YE-230.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/zm-aggregated.zone -O /srv/config/country-ipset/ipset-ZM-231.txt
wget --no-check-certificate https://www.ipdeny.com/ipblocks/data/aggregated/zw-aggregated.zone -O /srv/config/country-ipset/ipset-ZW-232.txt


# Create a set of IPsets for blocking
ipset create AF-1 hash:net
ipset create AX-2 hash:net
ipset create AL-3 hash:net
ipset create DZ-4 hash:net
ipset create AS-5 hash:net
ipset create AD-6 hash:net
ipset create AO-7 hash:net
ipset create AI-8 hash:net
ipset create AQ-9 hash:net
ipset create AG-10 hash:net
ipset create AR-11 hash:net
ipset create AM-12 hash:net
ipset create AW-13 hash:net
ipset create AU-14 hash:net
ipset create AT-15 hash:net
ipset create AZ-16 hash:net
ipset create BS-17 hash:net
ipset create BH-18 hash:net
ipset create BD-19 hash:net
ipset create BB-20 hash:net
ipset create BY-21 hash:net
ipset create BE-22 hash:net
ipset create BZ-23 hash:net
ipset create BJ-24 hash:net
ipset create BM-25 hash:net
ipset create BT-26 hash:net
ipset create BO-27 hash:net
ipset create BA-28 hash:net
ipset create BW-29 hash:net
ipset create BR-30 hash:net
ipset create IO-31 hash:net
ipset create BN-32 hash:net
ipset create BG-33 hash:net
ipset create BF-34 hash:net
ipset create BI-35 hash:net
ipset create KH-36 hash:net
ipset create CM-37 hash:net
ipset create CA-38 hash:net
ipset create CV-39 hash:net
ipset create KY-40 hash:net
ipset create CF-41 hash:net
ipset create TD-42 hash:net
ipset create CL-43 hash:net
ipset create CN-44 hash:net
ipset create CC-45 hash:net
ipset create CO-46 hash:net
ipset create KM-47 hash:net
ipset create CG-48 hash:net
ipset create CD-49 hash:net
ipset create CK-50 hash:net
ipset create CR-51 hash:net
ipset create CI-52 hash:net
ipset create HR-53 hash:net
ipset create CU-54 hash:net
ipset create CY-55 hash:net
ipset create CZ-56 hash:net
ipset create DK-57 hash:net
ipset create DJ-58 hash:net
ipset create DM-59 hash:net
ipset create DO-60 hash:net
ipset create EC-61 hash:net
ipset create EG-62 hash:net
ipset create SV-63 hash:net
ipset create GQ-64 hash:net
ipset create ER-65 hash:net
ipset create EE-66 hash:net
ipset create ET-67 hash:net
ipset create MA-68 hash:net
ipset create FO-69 hash:net
ipset create FJ-70 hash:net
ipset create FI-71 hash:net
ipset create FR-72 hash:net
ipset create GF-73 hash:net
ipset create PF-74 hash:net
ipset create GA-75 hash:net
ipset create GM-76 hash:net
ipset create GE-77 hash:net
ipset create DE-78 hash:net
ipset create GH-79 hash:net
ipset create GI-80 hash:net
ipset create GR-81 hash:net
ipset create GL-82 hash:net
ipset create GD-83 hash:net
ipset create GP-84 hash:net
ipset create GU-85 hash:net
ipset create GT-86 hash:net
ipset create GN-87 hash:net
ipset create GW-88 hash:net
ipset create GY-89 hash:net
ipset create HT-90 hash:net
ipset create VA-91 hash:net
ipset create HN-92 hash:net
ipset create HK-93 hash:net
ipset create HU-94 hash:net
ipset create IS-95 hash:net
ipset create IN-96 hash:net
ipset create ID-97 hash:net
ipset create IR-98 hash:net
ipset create IQ-99 hash:net
ipset create IE-100 hash:net
ipset create IM-101 hash:net
ipset create IL-102 hash:net
ipset create IT-103 hash:net
ipset create JM-104 hash:net
ipset create JP-105 hash:net
ipset create JE-106 hash:net
ipset create JO-107 hash:net
ipset create KZ-108 hash:net
ipset create KE-109 hash:net
ipset create KI-110 hash:net
ipset create KP-111 hash:net
ipset create KR-112 hash:net
ipset create KW-113 hash:net
ipset create KG-114 hash:net
ipset create LA-115 hash:net
ipset create LV-116 hash:net
ipset create LB-117 hash:net
ipset create LS-118 hash:net
ipset create LR-119 hash:net
ipset create LY-120 hash:net
ipset create LI-121 hash:net
ipset create LT-122 hash:net
ipset create LU-123 hash:net
ipset create MO-124 hash:net
ipset create MK-125 hash:net
ipset create MG-126 hash:net
ipset create MW-127 hash:net
ipset create MY-128 hash:net
ipset create MV-129 hash:net
ipset create ML-130 hash:net
ipset create MT-131 hash:net
ipset create MH-132 hash:net
ipset create MQ-133 hash:net
ipset create MR-134 hash:net
ipset create MU-135 hash:net
ipset create YT-136 hash:net
ipset create MX-137 hash:net
ipset create FM-138 hash:net
ipset create MD-139 hash:net
ipset create MC-140 hash:net
ipset create MN-141 hash:net
ipset create ME-142 hash:net
ipset create MS-143 hash:net
ipset create MA-144 hash:net
ipset create MZ-145 hash:net
ipset create MM-146 hash:net
ipset create NA-147 hash:net
ipset create NR-148 hash:net
ipset create NP-149 hash:net
ipset create NL-150 hash:net
ipset create NC-151 hash:net
ipset create NZ-152 hash:net
ipset create NI-153 hash:net
ipset create NE-154 hash:net
ipset create NG-155 hash:net
ipset create NU-156 hash:net
ipset create NF-157 hash:net
ipset create MP-158 hash:net
ipset create NO-159 hash:net
ipset create OM-160 hash:net
ipset create PK-161 hash:net
ipset create PW-162 hash:net
ipset create PS-163 hash:net
ipset create PA-164 hash:net
ipset create PG-165 hash:net
ipset create PY-166 hash:net
ipset create PE-167 hash:net
ipset create PH-168 hash:net
ipset create PL-169 hash:net
ipset create PT-170 hash:net
ipset create PR-171 hash:net
ipset create QA-172 hash:net
ipset create RE-173 hash:net
ipset create RO-174 hash:net
ipset create RU-175 hash:net
ipset create RW-176 hash:net
ipset create KN-177 hash:net
ipset create LC-178 hash:net
ipset create PM-179 hash:net
ipset create VC-180 hash:net
ipset create WS-181 hash:net
ipset create SM-182 hash:net
ipset create ST-183 hash:net
ipset create SA-184 hash:net
ipset create SN-185 hash:net
ipset create RS-186 hash:net
ipset create SC-187 hash:net
ipset create SL-188 hash:net
ipset create SG-189 hash:net
ipset create SK-190 hash:net
ipset create SI-191 hash:net
ipset create SB-192 hash:net
ipset create SO-193 hash:net
ipset create ZA-194 hash:net
ipset create ES-195 hash:net
ipset create LK-196 hash:net
ipset create SD-197 hash:net
ipset create SR-198 hash:net
ipset create SZ-199 hash:net
ipset create SE-200 hash:net
ipset create CH-201 hash:net
ipset create SY-202 hash:net
ipset create TW-203 hash:net
ipset create TJ-204 hash:net
ipset create TZ-205 hash:net
ipset create TH-206 hash:net
ipset create TL-207 hash:net
ipset create TG-208 hash:net
ipset create TK-209 hash:net
ipset create TO-210 hash:net
ipset create TT-211 hash:net
ipset create TN-212 hash:net
ipset create TR-213 hash:net
ipset create TM-214 hash:net
ipset create TC-215 hash:net
ipset create TV-216 hash:net
ipset create UG-217 hash:net
ipset create UA-218 hash:net
ipset create AE-219 hash:net
ipset create GB-220 hash:net
ipset create UM-221 hash:net
ipset create UY-222 hash:net
ipset create UZ-223 hash:net
ipset create VU-224 hash:net
ipset create VE-225 hash:net
ipset create VN-226 hash:net
ipset create VG-227 hash:net
ipset create VI-228 hash:net
ipset create WF-229 hash:net
ipset create YE-230 hash:net
ipset create ZM-231 hash:net
ipset create ZW-232 hash:net

# Add every IP range in the file to the 'china' set
for i in $(cat /srv/config/country-ipset/ipset-AF-1.txt); do ipset add AF-1 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AX-2.txt); do ipset add AX-2 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AL-3.txt); do ipset add AL-3 $i; done
for i in $(cat /srv/config/country-ipset/ipset-DZ-4.txt); do ipset add DZ-4 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AS-5.txt); do ipset add AS-5 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AD-6.txt); do ipset add AD-6 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AO-7.txt); do ipset add AO-7 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AI-8.txt); do ipset add AI-8 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AQ-9.txt); do ipset add AQ-9 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AG-10.txt); do ipset add AG-10 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AR-11.txt); do ipset add AR-11 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AM-12.txt); do ipset add AM-12 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AW-13.txt); do ipset add AW-13 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AU-14.txt); do ipset add AU-14 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AT-15.txt); do ipset add AT-15 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AZ-16.txt); do ipset add AZ-16 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BS-17.txt); do ipset add BS-17 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BH-18.txt); do ipset add BH-18 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BD-19.txt); do ipset add BD-19 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BB-20.txt); do ipset add BB-20 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BY-21.txt); do ipset add BY-21 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BE-22.txt); do ipset add BE-22 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BZ-23.txt); do ipset add BZ-23 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BJ-24.txt); do ipset add BJ-24 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BM-25.txt); do ipset add BM-25 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BT-26.txt); do ipset add BT-26 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BO-27.txt); do ipset add BO-27 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BA-28.txt); do ipset add BA-28 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BW-29.txt); do ipset add BW-29 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BR-30.txt); do ipset add BR-30 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IO-31.txt); do ipset add IO-31 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BN-32.txt); do ipset add BN-32 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BG-33.txt); do ipset add BG-33 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BF-34.txt); do ipset add BF-34 $i; done
for i in $(cat /srv/config/country-ipset/ipset-BI-35.txt); do ipset add BI-35 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KH-36.txt); do ipset add KH-36 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CM-37.txt); do ipset add CM-37 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CA-38.txt); do ipset add CA-38 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CV-39.txt); do ipset add CV-39 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KY-40.txt); do ipset add KY-40 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CF-41.txt); do ipset add CF-41 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TD-42.txt); do ipset add TD-42 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CL-43.txt); do ipset add CL-43 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CN-44.txt); do ipset add CN-44 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CC-45.txt); do ipset add CC-45 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CO-46.txt); do ipset add CO-46 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KM-47.txt); do ipset add KM-47 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CG-48.txt); do ipset add CG-48 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CD-49.txt); do ipset add CD-49 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CK-50.txt); do ipset add CK-50 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CR-51.txt); do ipset add CR-51 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CI-52.txt); do ipset add CI-52 $i; done
for i in $(cat /srv/config/country-ipset/ipset-HR-53.txt); do ipset add HR-53 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CU-54.txt); do ipset add CU-54 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CY-55.txt); do ipset add CY-55 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CZ-56.txt); do ipset add CZ-56 $i; done
for i in $(cat /srv/config/country-ipset/ipset-DK-57.txt); do ipset add DK-57 $i; done
for i in $(cat /srv/config/country-ipset/ipset-DJ-58.txt); do ipset add DJ-58 $i; done
for i in $(cat /srv/config/country-ipset/ipset-DM-59.txt); do ipset add DM-59 $i; done
for i in $(cat /srv/config/country-ipset/ipset-DO-60.txt); do ipset add DO-60 $i; done
for i in $(cat /srv/config/country-ipset/ipset-EC-61.txt); do ipset add EC-61 $i; done
for i in $(cat /srv/config/country-ipset/ipset-EG-62.txt); do ipset add EG-62 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SV-63.txt); do ipset add SV-63 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GQ-64.txt); do ipset add GQ-64 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ER-65.txt); do ipset add ER-65 $i; done
for i in $(cat /srv/config/country-ipset/ipset-EE-66.txt); do ipset add EE-66 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ET-67.txt); do ipset add ET-67 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MA-68.txt); do ipset add MA-68 $i; done
for i in $(cat /srv/config/country-ipset/ipset-FO-69.txt); do ipset add FO-69 $i; done
for i in $(cat /srv/config/country-ipset/ipset-FJ-70.txt); do ipset add FJ-70 $i; done
for i in $(cat /srv/config/country-ipset/ipset-FI-71.txt); do ipset add FI-71 $i; done
for i in $(cat /srv/config/country-ipset/ipset-FR-72.txt); do ipset add FR-72 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GF-73.txt); do ipset add GF-73 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PF-74.txt); do ipset add PF-74 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GA-75.txt); do ipset add GA-75 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GM-76.txt); do ipset add GM-76 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GE-77.txt); do ipset add GE-77 $i; done
for i in $(cat /srv/config/country-ipset/ipset-DE-78.txt); do ipset add DE-78 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GH-79.txt); do ipset add GH-79 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GI-80.txt); do ipset add GI-80 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GR-81.txt); do ipset add GR-81 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GL-82.txt); do ipset add GL-82 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GD-83.txt); do ipset add GD-83 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GP-84.txt); do ipset add GP-84 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GU-85.txt); do ipset add GU-85 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GT-86.txt); do ipset add GT-86 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GN-87.txt); do ipset add GN-87 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GW-88.txt); do ipset add GW-88 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GY-89.txt); do ipset add GY-89 $i; done
for i in $(cat /srv/config/country-ipset/ipset-HT-90.txt); do ipset add HT-90 $i; done
for i in $(cat /srv/config/country-ipset/ipset-VA-91.txt); do ipset add VA-91 $i; done
for i in $(cat /srv/config/country-ipset/ipset-HN-92.txt); do ipset add HN-92 $i; done
for i in $(cat /srv/config/country-ipset/ipset-HK-93.txt); do ipset add HK-93 $i; done
for i in $(cat /srv/config/country-ipset/ipset-HU-94.txt); do ipset add HU-94 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IS-95.txt); do ipset add IS-95 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IN-96.txt); do ipset add IN-96 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ID-97.txt); do ipset add ID-97 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IR-98.txt); do ipset add IR-98 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IQ-99.txt); do ipset add IQ-99 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IE-100.txt); do ipset add IE-100 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IM-101.txt); do ipset add IM-101 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IL-102.txt); do ipset add IL-102 $i; done
for i in $(cat /srv/config/country-ipset/ipset-IT-103.txt); do ipset add IT-103 $i; done
for i in $(cat /srv/config/country-ipset/ipset-JM-104.txt); do ipset add JM-104 $i; done
for i in $(cat /srv/config/country-ipset/ipset-JP-105.txt); do ipset add JP-105 $i; done
for i in $(cat /srv/config/country-ipset/ipset-JE-106.txt); do ipset add JE-106 $i; done
for i in $(cat /srv/config/country-ipset/ipset-JO-107.txt); do ipset add JO-107 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KZ-108.txt); do ipset add KZ-108 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KE-109.txt); do ipset add KE-109 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KI-110.txt); do ipset add KI-110 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KP-111.txt); do ipset add KP-111 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KR-112.txt); do ipset add KR-112 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KW-113.txt); do ipset add KW-113 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KG-114.txt); do ipset add KG-114 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LA-115.txt); do ipset add LA-115 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LV-116.txt); do ipset add LV-116 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LB-117.txt); do ipset add LB-117 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LS-118.txt); do ipset add LS-118 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LR-119.txt); do ipset add LR-119 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LY-120.txt); do ipset add LY-120 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LI-121.txt); do ipset add LI-121 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LT-122.txt); do ipset add LT-122 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LU-123.txt); do ipset add LU-123 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MO-124.txt); do ipset add MO-124 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MK-125.txt); do ipset add MK-125 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MG-126.txt); do ipset add MG-126 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MW-127.txt); do ipset add MW-127 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MY-128.txt); do ipset add MY-128 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MV-129.txt); do ipset add MV-129 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ML-130.txt); do ipset add ML-130 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MT-131.txt); do ipset add MT-131 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MH-132.txt); do ipset add MH-132 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MQ-133.txt); do ipset add MQ-133 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MR-134.txt); do ipset add MR-134 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MU-135.txt); do ipset add MU-135 $i; done
for i in $(cat /srv/config/country-ipset/ipset-YT-136.txt); do ipset add YT-136 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MX-137.txt); do ipset add MX-137 $i; done
for i in $(cat /srv/config/country-ipset/ipset-FM-138.txt); do ipset add FM-138 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MD-139.txt); do ipset add MD-139 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MC-140.txt); do ipset add MC-140 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MN-141.txt); do ipset add MN-141 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ME-142.txt); do ipset add ME-142 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MS-143.txt); do ipset add MS-143 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MA-144.txt); do ipset add MA-144 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MZ-145.txt); do ipset add MZ-145 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MM-146.txt); do ipset add MM-146 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NA-147.txt); do ipset add NA-147 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NR-148.txt); do ipset add NR-148 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NP-149.txt); do ipset add NP-149 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NL-150.txt); do ipset add NL-150 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NC-151.txt); do ipset add NC-151 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NZ-152.txt); do ipset add NZ-152 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NI-153.txt); do ipset add NI-153 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NE-154.txt); do ipset add NE-154 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NG-155.txt); do ipset add NG-155 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NU-156.txt); do ipset add NU-156 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NF-157.txt); do ipset add NF-157 $i; done
for i in $(cat /srv/config/country-ipset/ipset-MP-158.txt); do ipset add MP-158 $i; done
for i in $(cat /srv/config/country-ipset/ipset-NO-159.txt); do ipset add NO-159 $i; done
for i in $(cat /srv/config/country-ipset/ipset-OM-160.txt); do ipset add OM-160 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PK-161.txt); do ipset add PK-161 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PW-162.txt); do ipset add PW-162 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PS-163.txt); do ipset add PS-163 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PA-164.txt); do ipset add PA-164 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PG-165.txt); do ipset add PG-165 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PY-166.txt); do ipset add PY-166 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PE-167.txt); do ipset add PE-167 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PH-168.txt); do ipset add PH-168 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PL-169.txt); do ipset add PL-169 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PT-170.txt); do ipset add PT-170 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PR-171.txt); do ipset add PR-171 $i; done
for i in $(cat /srv/config/country-ipset/ipset-QA-172.txt); do ipset add QA-172 $i; done
for i in $(cat /srv/config/country-ipset/ipset-RE-173.txt); do ipset add RE-173 $i; done
for i in $(cat /srv/config/country-ipset/ipset-RO-174.txt); do ipset add RO-174 $i; done
for i in $(cat /srv/config/country-ipset/ipset-RU-175.txt); do ipset add RU-175 $i; done
for i in $(cat /srv/config/country-ipset/ipset-RW-176.txt); do ipset add RW-176 $i; done
for i in $(cat /srv/config/country-ipset/ipset-KN-177.txt); do ipset add KN-177 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LC-178.txt); do ipset add LC-178 $i; done
for i in $(cat /srv/config/country-ipset/ipset-PM-179.txt); do ipset add PM-179 $i; done
for i in $(cat /srv/config/country-ipset/ipset-VC-180.txt); do ipset add VC-180 $i; done
for i in $(cat /srv/config/country-ipset/ipset-WS-181.txt); do ipset add WS-181 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SM-182.txt); do ipset add SM-182 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ST-183.txt); do ipset add ST-183 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SA-184.txt); do ipset add SA-184 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SN-185.txt); do ipset add SN-185 $i; done
for i in $(cat /srv/config/country-ipset/ipset-RS-186.txt); do ipset add RS-186 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SC-187.txt); do ipset add SC-187 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SL-188.txt); do ipset add SL-188 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SG-189.txt); do ipset add SG-189 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SK-190.txt); do ipset add SK-190 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SI-191.txt); do ipset add SI-191 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SB-192.txt); do ipset add SB-192 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SO-193.txt); do ipset add SO-193 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ZA-194.txt); do ipset add ZA-194 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ES-195.txt); do ipset add ES-195 $i; done
for i in $(cat /srv/config/country-ipset/ipset-LK-196.txt); do ipset add LK-196 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SD-197.txt); do ipset add SD-197 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SR-198.txt); do ipset add SR-198 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SZ-199.txt); do ipset add SZ-199 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SE-200.txt); do ipset add SE-200 $i; done
for i in $(cat /srv/config/country-ipset/ipset-CH-201.txt); do ipset add CH-201 $i; done
for i in $(cat /srv/config/country-ipset/ipset-SY-202.txt); do ipset add SY-202 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TW-203.txt); do ipset add TW-203 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TJ-204.txt); do ipset add TJ-204 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TZ-205.txt); do ipset add TZ-205 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TH-206.txt); do ipset add TH-206 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TL-207.txt); do ipset add TL-207 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TG-208.txt); do ipset add TG-208 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TK-209.txt); do ipset add TK-209 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TO-210.txt); do ipset add TO-210 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TT-211.txt); do ipset add TT-211 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TN-212.txt); do ipset add TN-212 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TR-213.txt); do ipset add TR-213 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TM-214.txt); do ipset add TM-214 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TC-215.txt); do ipset add TC-215 $i; done
for i in $(cat /srv/config/country-ipset/ipset-TV-216.txt); do ipset add TV-216 $i; done
for i in $(cat /srv/config/country-ipset/ipset-UG-217.txt); do ipset add UG-217 $i; done
for i in $(cat /srv/config/country-ipset/ipset-UA-218.txt); do ipset add UA-218 $i; done
for i in $(cat /srv/config/country-ipset/ipset-AE-219.txt); do ipset add AE-219 $i; done
for i in $(cat /srv/config/country-ipset/ipset-GB-220.txt); do ipset add GB-220 $i; done
for i in $(cat /srv/config/country-ipset/ipset-UM-221.txt); do ipset add UM-221 $i; done
for i in $(cat /srv/config/country-ipset/ipset-UY-222.txt); do ipset add UY-222 $i; done
for i in $(cat /srv/config/country-ipset/ipset-UZ-223.txt); do ipset add UZ-223 $i; done
for i in $(cat /srv/config/country-ipset/ipset-VU-224.txt); do ipset add VU-224 $i; done
for i in $(cat /srv/config/country-ipset/ipset-VE-225.txt); do ipset add VE-225 $i; done
for i in $(cat /srv/config/country-ipset/ipset-VN-226.txt); do ipset add VN-226 $i; done
for i in $(cat /srv/config/country-ipset/ipset-VG-227.txt); do ipset add VG-227 $i; done
for i in $(cat /srv/config/country-ipset/ipset-VI-228.txt); do ipset add VI-228 $i; done
for i in $(cat /srv/config/country-ipset/ipset-WF-229.txt); do ipset add WF-229 $i; done
for i in $(cat /srv/config/country-ipset/ipset-YE-230.txt); do ipset add YE-230 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ZM-231.txt); do ipset add ZM-231 $i; done
for i in $(cat /srv/config/country-ipset/ipset-ZW-232.txt); do ipset add ZW-232 $i; done


# Block the 'china' set with IPtables
iptables -A INPUT -m set --match-set AF-1 src -j DROP -m comment --comment Drop-Country-AF-1
iptables -A INPUT -m set --match-set AX-2 src -j DROP -m comment --comment Drop-Country-AX-2
iptables -A INPUT -m set --match-set AL-3 src -j DROP -m comment --comment Drop-Country-AL-3
iptables -A INPUT -m set --match-set DZ-4 src -j DROP -m comment --comment Drop-Country-DZ-4
iptables -A INPUT -m set --match-set AS-5 src -j DROP -m comment --comment Drop-Country-AS-5
iptables -A INPUT -m set --match-set AD-6 src -j DROP -m comment --comment Drop-Country-AD-6
iptables -A INPUT -m set --match-set AO-7 src -j DROP -m comment --comment Drop-Country-AO-7
iptables -A INPUT -m set --match-set AI-8 src -j DROP -m comment --comment Drop-Country-AI-8
iptables -A INPUT -m set --match-set AQ-9 src -j DROP -m comment --comment Drop-Country-AQ-9
iptables -A INPUT -m set --match-set AG-10 src -j DROP -m comment --comment Drop-Country-AG-10
iptables -A INPUT -m set --match-set AR-11 src -j DROP -m comment --comment Drop-Country-AR-11
iptables -A INPUT -m set --match-set AM-12 src -j DROP -m comment --comment Drop-Country-AM-12
iptables -A INPUT -m set --match-set AW-13 src -j DROP -m comment --comment Drop-Country-AW-13
iptables -A INPUT -m set --match-set AU-14 src -j DROP -m comment --comment Drop-Country-AU-14
iptables -A INPUT -m set --match-set AT-15 src -j DROP -m comment --comment Drop-Country-AT-15
iptables -A INPUT -m set --match-set AZ-16 src -j DROP -m comment --comment Drop-Country-AZ-16
iptables -A INPUT -m set --match-set BS-17 src -j DROP -m comment --comment Drop-Country-BS-17
iptables -A INPUT -m set --match-set BH-18 src -j DROP -m comment --comment Drop-Country-BH-18
iptables -A INPUT -m set --match-set BD-19 src -j DROP -m comment --comment Drop-Country-BD-19
iptables -A INPUT -m set --match-set BB-20 src -j DROP -m comment --comment Drop-Country-BB-20
iptables -A INPUT -m set --match-set BY-21 src -j DROP -m comment --comment Drop-Country-BY-21
iptables -A INPUT -m set --match-set BE-22 src -j DROP -m comment --comment Drop-Country-BE-22
iptables -A INPUT -m set --match-set BZ-23 src -j DROP -m comment --comment Drop-Country-BZ-23
iptables -A INPUT -m set --match-set BJ-24 src -j DROP -m comment --comment Drop-Country-BJ-24
iptables -A INPUT -m set --match-set BM-25 src -j DROP -m comment --comment Drop-Country-BM-25
iptables -A INPUT -m set --match-set BT-26 src -j DROP -m comment --comment Drop-Country-BT-26
iptables -A INPUT -m set --match-set BO-27 src -j DROP -m comment --comment Drop-Country-BO-27
iptables -A INPUT -m set --match-set BA-28 src -j DROP -m comment --comment Drop-Country-BA-28
iptables -A INPUT -m set --match-set BW-29 src -j DROP -m comment --comment Drop-Country-BW-29
iptables -A INPUT -m set --match-set BR-30 src -j DROP -m comment --comment Drop-Country-BR-30
iptables -A INPUT -m set --match-set IO-31 src -j DROP -m comment --comment Drop-Country-IO-31
iptables -A INPUT -m set --match-set BN-32 src -j DROP -m comment --comment Drop-Country-BN-32
iptables -A INPUT -m set --match-set BG-33 src -j DROP -m comment --comment Drop-Country-BG-33
iptables -A INPUT -m set --match-set BF-34 src -j DROP -m comment --comment Drop-Country-BF-34
iptables -A INPUT -m set --match-set BI-35 src -j DROP -m comment --comment Drop-Country-BI-35
iptables -A INPUT -m set --match-set KH-36 src -j DROP -m comment --comment Drop-Country-KH-36
iptables -A INPUT -m set --match-set CM-37 src -j DROP -m comment --comment Drop-Country-CM-37
iptables -A INPUT -m set --match-set CA-38 src -j DROP -m comment --comment Drop-Country-CA-38
iptables -A INPUT -m set --match-set CV-39 src -j DROP -m comment --comment Drop-Country-CV-39
iptables -A INPUT -m set --match-set KY-40 src -j DROP -m comment --comment Drop-Country-KY-40
iptables -A INPUT -m set --match-set CF-41 src -j DROP -m comment --comment Drop-Country-CF-41
iptables -A INPUT -m set --match-set TD-42 src -j DROP -m comment --comment Drop-Country-TD-42
iptables -A INPUT -m set --match-set CL-43 src -j DROP -m comment --comment Drop-Country-CL-43
iptables -A INPUT -m set --match-set CN-44 src -j DROP -m comment --comment Drop-Country-CN-44
iptables -A INPUT -m set --match-set CC-45 src -j DROP -m comment --comment Drop-Country-CC-45
iptables -A INPUT -m set --match-set CO-46 src -j DROP -m comment --comment Drop-Country-CO-46
iptables -A INPUT -m set --match-set KM-47 src -j DROP -m comment --comment Drop-Country-KM-47
iptables -A INPUT -m set --match-set CG-48 src -j DROP -m comment --comment Drop-Country-CG-48
iptables -A INPUT -m set --match-set CD-49 src -j DROP -m comment --comment Drop-Country-CD-49
iptables -A INPUT -m set --match-set CK-50 src -j DROP -m comment --comment Drop-Country-CK-50
iptables -A INPUT -m set --match-set CR-51 src -j DROP -m comment --comment Drop-Country-CR-51
iptables -A INPUT -m set --match-set CI-52 src -j DROP -m comment --comment Drop-Country-CI-52
iptables -A INPUT -m set --match-set HR-53 src -j DROP -m comment --comment Drop-Country-HR-53
iptables -A INPUT -m set --match-set CU-54 src -j DROP -m comment --comment Drop-Country-CU-54
iptables -A INPUT -m set --match-set CY-55 src -j DROP -m comment --comment Drop-Country-CY-55
iptables -A INPUT -m set --match-set CZ-56 src -j DROP -m comment --comment Drop-Country-CZ-56
iptables -A INPUT -m set --match-set DK-57 src -j DROP -m comment --comment Drop-Country-DK-57
iptables -A INPUT -m set --match-set DJ-58 src -j DROP -m comment --comment Drop-Country-DJ-58
iptables -A INPUT -m set --match-set DM-59 src -j DROP -m comment --comment Drop-Country-DM-59
iptables -A INPUT -m set --match-set DO-60 src -j DROP -m comment --comment Drop-Country-DO-60
iptables -A INPUT -m set --match-set EC-61 src -j DROP -m comment --comment Drop-Country-EC-61
iptables -A INPUT -m set --match-set EG-62 src -j DROP -m comment --comment Drop-Country-EG-62
iptables -A INPUT -m set --match-set SV-63 src -j DROP -m comment --comment Drop-Country-SV-63
iptables -A INPUT -m set --match-set GQ-64 src -j DROP -m comment --comment Drop-Country-GQ-64
iptables -A INPUT -m set --match-set ER-65 src -j DROP -m comment --comment Drop-Country-ER-65
iptables -A INPUT -m set --match-set EE-66 src -j DROP -m comment --comment Drop-Country-EE-66
iptables -A INPUT -m set --match-set ET-67 src -j DROP -m comment --comment Drop-Country-ET-67
iptables -A INPUT -m set --match-set MA-68 src -j DROP -m comment --comment Drop-Country-MA-68
iptables -A INPUT -m set --match-set FO-69 src -j DROP -m comment --comment Drop-Country-FO-69
iptables -A INPUT -m set --match-set FJ-70 src -j DROP -m comment --comment Drop-Country-FJ-70
iptables -A INPUT -m set --match-set FI-71 src -j DROP -m comment --comment Drop-Country-FI-71
iptables -A INPUT -m set --match-set FR-72 src -j DROP -m comment --comment Drop-Country-FR-72
iptables -A INPUT -m set --match-set GF-73 src -j DROP -m comment --comment Drop-Country-GF-73
iptables -A INPUT -m set --match-set PF-74 src -j DROP -m comment --comment Drop-Country-PF-74
iptables -A INPUT -m set --match-set GA-75 src -j DROP -m comment --comment Drop-Country-GA-75
iptables -A INPUT -m set --match-set GM-76 src -j DROP -m comment --comment Drop-Country-GM-76
iptables -A INPUT -m set --match-set GE-77 src -j DROP -m comment --comment Drop-Country-GE-77
iptables -A INPUT -m set --match-set DE-78 src -j DROP -m comment --comment Drop-Country-DE-78
iptables -A INPUT -m set --match-set GH-79 src -j DROP -m comment --comment Drop-Country-GH-79
iptables -A INPUT -m set --match-set GI-80 src -j DROP -m comment --comment Drop-Country-GI-80
iptables -A INPUT -m set --match-set GR-81 src -j DROP -m comment --comment Drop-Country-GR-81
iptables -A INPUT -m set --match-set GL-82 src -j DROP -m comment --comment Drop-Country-GL-82
iptables -A INPUT -m set --match-set GD-83 src -j DROP -m comment --comment Drop-Country-GD-83
iptables -A INPUT -m set --match-set GP-84 src -j DROP -m comment --comment Drop-Country-GP-84
iptables -A INPUT -m set --match-set GU-85 src -j DROP -m comment --comment Drop-Country-GU-85
iptables -A INPUT -m set --match-set GT-86 src -j DROP -m comment --comment Drop-Country-GT-86
iptables -A INPUT -m set --match-set GN-87 src -j DROP -m comment --comment Drop-Country-GN-87
iptables -A INPUT -m set --match-set GW-88 src -j DROP -m comment --comment Drop-Country-GW-88
iptables -A INPUT -m set --match-set GY-89 src -j DROP -m comment --comment Drop-Country-GY-89
iptables -A INPUT -m set --match-set HT-90 src -j DROP -m comment --comment Drop-Country-HT-90
iptables -A INPUT -m set --match-set VA-91 src -j DROP -m comment --comment Drop-Country-VA-91
iptables -A INPUT -m set --match-set HN-92 src -j DROP -m comment --comment Drop-Country-HN-92
iptables -A INPUT -m set --match-set HK-93 src -j DROP -m comment --comment Drop-Country-HK-93
iptables -A INPUT -m set --match-set HU-94 src -j DROP -m comment --comment Drop-Country-HU-94
iptables -A INPUT -m set --match-set IS-95 src -j DROP -m comment --comment Drop-Country-IS-95
iptables -A INPUT -m set --match-set IN-96 src -j DROP -m comment --comment Drop-Country-IN-96
iptables -A INPUT -m set --match-set ID-97 src -j DROP -m comment --comment Drop-Country-ID-97
iptables -A INPUT -m set --match-set IR-98 src -j DROP -m comment --comment Drop-Country-IR-98
iptables -A INPUT -m set --match-set IQ-99 src -j DROP -m comment --comment Drop-Country-IQ-99
iptables -A INPUT -m set --match-set IE-100 src -j DROP -m comment --comment Drop-Country-IE-100
iptables -A INPUT -m set --match-set IM-101 src -j DROP -m comment --comment Drop-Country-IM-101
iptables -A INPUT -m set --match-set IL-102 src -j DROP -m comment --comment Drop-Country-IL-102
iptables -A INPUT -m set --match-set IT-103 src -j DROP -m comment --comment Drop-Country-IT-103
iptables -A INPUT -m set --match-set JM-104 src -j DROP -m comment --comment Drop-Country-JM-104
iptables -A INPUT -m set --match-set JP-105 src -j DROP -m comment --comment Drop-Country-JP-105
iptables -A INPUT -m set --match-set JE-106 src -j DROP -m comment --comment Drop-Country-JE-106
iptables -A INPUT -m set --match-set JO-107 src -j DROP -m comment --comment Drop-Country-JO-107
iptables -A INPUT -m set --match-set KZ-108 src -j DROP -m comment --comment Drop-Country-KZ-108
iptables -A INPUT -m set --match-set KE-109 src -j DROP -m comment --comment Drop-Country-KE-109
iptables -A INPUT -m set --match-set KI-110 src -j DROP -m comment --comment Drop-Country-KI-110
iptables -A INPUT -m set --match-set KP-111 src -j DROP -m comment --comment Drop-Country-KP-111
iptables -A INPUT -m set --match-set KR-112 src -j DROP -m comment --comment Drop-Country-KR-112
iptables -A INPUT -m set --match-set KW-113 src -j DROP -m comment --comment Drop-Country-KW-113
iptables -A INPUT -m set --match-set KG-114 src -j DROP -m comment --comment Drop-Country-KG-114
iptables -A INPUT -m set --match-set LA-115 src -j DROP -m comment --comment Drop-Country-LA-115
iptables -A INPUT -m set --match-set LV-116 src -j DROP -m comment --comment Drop-Country-LV-116
iptables -A INPUT -m set --match-set LB-117 src -j DROP -m comment --comment Drop-Country-LB-117
iptables -A INPUT -m set --match-set LS-118 src -j DROP -m comment --comment Drop-Country-LS-118
iptables -A INPUT -m set --match-set LR-119 src -j DROP -m comment --comment Drop-Country-LR-119
iptables -A INPUT -m set --match-set LY-120 src -j DROP -m comment --comment Drop-Country-LY-120
iptables -A INPUT -m set --match-set LI-121 src -j DROP -m comment --comment Drop-Country-LI-121
iptables -A INPUT -m set --match-set LT-122 src -j DROP -m comment --comment Drop-Country-LT-122
iptables -A INPUT -m set --match-set LU-123 src -j DROP -m comment --comment Drop-Country-LU-123
iptables -A INPUT -m set --match-set MO-124 src -j DROP -m comment --comment Drop-Country-MO-124
iptables -A INPUT -m set --match-set MK-125 src -j DROP -m comment --comment Drop-Country-MK-125
iptables -A INPUT -m set --match-set MG-126 src -j DROP -m comment --comment Drop-Country-MG-126
iptables -A INPUT -m set --match-set MW-127 src -j DROP -m comment --comment Drop-Country-MW-127
iptables -A INPUT -m set --match-set MY-128 src -j DROP -m comment --comment Drop-Country-MY-128
iptables -A INPUT -m set --match-set MV-129 src -j DROP -m comment --comment Drop-Country-MV-129
iptables -A INPUT -m set --match-set ML-130 src -j DROP -m comment --comment Drop-Country-ML-130
iptables -A INPUT -m set --match-set MT-131 src -j DROP -m comment --comment Drop-Country-MT-131
iptables -A INPUT -m set --match-set MH-132 src -j DROP -m comment --comment Drop-Country-MH-132
iptables -A INPUT -m set --match-set MQ-133 src -j DROP -m comment --comment Drop-Country-MQ-133
iptables -A INPUT -m set --match-set MR-134 src -j DROP -m comment --comment Drop-Country-MR-134
iptables -A INPUT -m set --match-set MU-135 src -j DROP -m comment --comment Drop-Country-MU-135
iptables -A INPUT -m set --match-set YT-136 src -j DROP -m comment --comment Drop-Country-YT-136
iptables -A INPUT -m set --match-set MX-137 src -j DROP -m comment --comment Drop-Country-MX-137
iptables -A INPUT -m set --match-set FM-138 src -j DROP -m comment --comment Drop-Country-FM-138
iptables -A INPUT -m set --match-set MD-139 src -j DROP -m comment --comment Drop-Country-MD-139
iptables -A INPUT -m set --match-set MC-140 src -j DROP -m comment --comment Drop-Country-MC-140
iptables -A INPUT -m set --match-set MN-141 src -j DROP -m comment --comment Drop-Country-MN-141
iptables -A INPUT -m set --match-set ME-142 src -j DROP -m comment --comment Drop-Country-ME-142
iptables -A INPUT -m set --match-set MS-143 src -j DROP -m comment --comment Drop-Country-MS-143
iptables -A INPUT -m set --match-set MA-144 src -j DROP -m comment --comment Drop-Country-MA-144
iptables -A INPUT -m set --match-set MZ-145 src -j DROP -m comment --comment Drop-Country-MZ-145
iptables -A INPUT -m set --match-set MM-146 src -j DROP -m comment --comment Drop-Country-MM-146
iptables -A INPUT -m set --match-set NA-147 src -j DROP -m comment --comment Drop-Country-NA-147
iptables -A INPUT -m set --match-set NR-148 src -j DROP -m comment --comment Drop-Country-NR-148
iptables -A INPUT -m set --match-set NP-149 src -j DROP -m comment --comment Drop-Country-NP-149
iptables -A INPUT -m set --match-set NL-150 src -j DROP -m comment --comment Drop-Country-NL-150
iptables -A INPUT -m set --match-set NC-151 src -j DROP -m comment --comment Drop-Country-NC-151
iptables -A INPUT -m set --match-set NZ-152 src -j DROP -m comment --comment Drop-Country-NZ-152
iptables -A INPUT -m set --match-set NI-153 src -j DROP -m comment --comment Drop-Country-NI-153
iptables -A INPUT -m set --match-set NE-154 src -j DROP -m comment --comment Drop-Country-NE-154
iptables -A INPUT -m set --match-set NG-155 src -j DROP -m comment --comment Drop-Country-NG-155
iptables -A INPUT -m set --match-set NU-156 src -j DROP -m comment --comment Drop-Country-NU-156
iptables -A INPUT -m set --match-set NF-157 src -j DROP -m comment --comment Drop-Country-NF-157
iptables -A INPUT -m set --match-set MP-158 src -j DROP -m comment --comment Drop-Country-MP-158
iptables -A INPUT -m set --match-set NO-159 src -j DROP -m comment --comment Drop-Country-NO-159
iptables -A INPUT -m set --match-set OM-160 src -j DROP -m comment --comment Drop-Country-OM-160
iptables -A INPUT -m set --match-set PK-161 src -j DROP -m comment --comment Drop-Country-PK-161
iptables -A INPUT -m set --match-set PW-162 src -j DROP -m comment --comment Drop-Country-PW-162
iptables -A INPUT -m set --match-set PS-163 src -j DROP -m comment --comment Drop-Country-PS-163
iptables -A INPUT -m set --match-set PA-164 src -j DROP -m comment --comment Drop-Country-PA-164
iptables -A INPUT -m set --match-set PG-165 src -j DROP -m comment --comment Drop-Country-PG-165
iptables -A INPUT -m set --match-set PY-166 src -j DROP -m comment --comment Drop-Country-PY-166
iptables -A INPUT -m set --match-set PE-167 src -j DROP -m comment --comment Drop-Country-PE-167
iptables -A INPUT -m set --match-set PH-168 src -j DROP -m comment --comment Drop-Country-PH-168
iptables -A INPUT -m set --match-set PL-169 src -j DROP -m comment --comment Drop-Country-PL-169
iptables -A INPUT -m set --match-set PT-170 src -j DROP -m comment --comment Drop-Country-PT-170
iptables -A INPUT -m set --match-set PR-171 src -j DROP -m comment --comment Drop-Country-PR-171
iptables -A INPUT -m set --match-set QA-172 src -j DROP -m comment --comment Drop-Country-QA-172
iptables -A INPUT -m set --match-set RE-173 src -j DROP -m comment --comment Drop-Country-RE-173
iptables -A INPUT -m set --match-set RO-174 src -j DROP -m comment --comment Drop-Country-RO-174
iptables -A INPUT -m set --match-set RU-175 src -j DROP -m comment --comment Drop-Country-RU-175
iptables -A INPUT -m set --match-set RW-176 src -j DROP -m comment --comment Drop-Country-RW-176
iptables -A INPUT -m set --match-set KN-177 src -j DROP -m comment --comment Drop-Country-KN-177
iptables -A INPUT -m set --match-set LC-178 src -j DROP -m comment --comment Drop-Country-LC-178
iptables -A INPUT -m set --match-set PM-179 src -j DROP -m comment --comment Drop-Country-PM-179
iptables -A INPUT -m set --match-set VC-180 src -j DROP -m comment --comment Drop-Country-VC-180
iptables -A INPUT -m set --match-set WS-181 src -j DROP -m comment --comment Drop-Country-WS-181
iptables -A INPUT -m set --match-set SM-182 src -j DROP -m comment --comment Drop-Country-SM-182
iptables -A INPUT -m set --match-set ST-183 src -j DROP -m comment --comment Drop-Country-ST-183
iptables -A INPUT -m set --match-set SA-184 src -j DROP -m comment --comment Drop-Country-SA-184
iptables -A INPUT -m set --match-set SN-185 src -j DROP -m comment --comment Drop-Country-SN-185
iptables -A INPUT -m set --match-set RS-186 src -j DROP -m comment --comment Drop-Country-RS-186
iptables -A INPUT -m set --match-set SC-187 src -j DROP -m comment --comment Drop-Country-SC-187
iptables -A INPUT -m set --match-set SL-188 src -j DROP -m comment --comment Drop-Country-SL-188
iptables -A INPUT -m set --match-set SG-189 src -j DROP -m comment --comment Drop-Country-SG-189
iptables -A INPUT -m set --match-set SK-190 src -j DROP -m comment --comment Drop-Country-SK-190
iptables -A INPUT -m set --match-set SI-191 src -j DROP -m comment --comment Drop-Country-SI-191
iptables -A INPUT -m set --match-set SB-192 src -j DROP -m comment --comment Drop-Country-SB-192
iptables -A INPUT -m set --match-set SO-193 src -j DROP -m comment --comment Drop-Country-SO-193
iptables -A INPUT -m set --match-set ZA-194 src -j DROP -m comment --comment Drop-Country-ZA-194
iptables -A INPUT -m set --match-set ES-195 src -j DROP -m comment --comment Drop-Country-ES-195
iptables -A INPUT -m set --match-set LK-196 src -j DROP -m comment --comment Drop-Country-LK-196
iptables -A INPUT -m set --match-set SD-197 src -j DROP -m comment --comment Drop-Country-SD-197
iptables -A INPUT -m set --match-set SR-198 src -j DROP -m comment --comment Drop-Country-SR-198
iptables -A INPUT -m set --match-set SZ-199 src -j DROP -m comment --comment Drop-Country-SZ-199
iptables -A INPUT -m set --match-set SE-200 src -j DROP -m comment --comment Drop-Country-SE-200
iptables -A INPUT -m set --match-set CH-201 src -j DROP -m comment --comment Drop-Country-CH-201
iptables -A INPUT -m set --match-set SY-202 src -j DROP -m comment --comment Drop-Country-SY-202
iptables -A INPUT -m set --match-set TW-203 src -j DROP -m comment --comment Drop-Country-TW-203
iptables -A INPUT -m set --match-set TJ-204 src -j DROP -m comment --comment Drop-Country-TJ-204
iptables -A INPUT -m set --match-set TZ-205 src -j DROP -m comment --comment Drop-Country-TZ-205
iptables -A INPUT -m set --match-set TH-206 src -j DROP -m comment --comment Drop-Country-TH-206
iptables -A INPUT -m set --match-set TL-207 src -j DROP -m comment --comment Drop-Country-TL-207
iptables -A INPUT -m set --match-set TG-208 src -j DROP -m comment --comment Drop-Country-TG-208
iptables -A INPUT -m set --match-set TK-209 src -j DROP -m comment --comment Drop-Country-TK-209
iptables -A INPUT -m set --match-set TO-210 src -j DROP -m comment --comment Drop-Country-TO-210
iptables -A INPUT -m set --match-set TT-211 src -j DROP -m comment --comment Drop-Country-TT-211
iptables -A INPUT -m set --match-set TN-212 src -j DROP -m comment --comment Drop-Country-TN-212
iptables -A INPUT -m set --match-set TR-213 src -j DROP -m comment --comment Drop-Country-TR-213
iptables -A INPUT -m set --match-set TM-214 src -j DROP -m comment --comment Drop-Country-TM-214
iptables -A INPUT -m set --match-set TC-215 src -j DROP -m comment --comment Drop-Country-TC-215
iptables -A INPUT -m set --match-set TV-216 src -j DROP -m comment --comment Drop-Country-TV-216
iptables -A INPUT -m set --match-set UG-217 src -j DROP -m comment --comment Drop-Country-UG-217
iptables -A INPUT -m set --match-set UA-218 src -j DROP -m comment --comment Drop-Country-UA-218
iptables -A INPUT -m set --match-set AE-219 src -j DROP -m comment --comment Drop-Country-AE-219
iptables -A INPUT -m set --match-set GB-220 src -j DROP -m comment --comment Drop-Country-GB-220
iptables -A INPUT -m set --match-set UM-221 src -j DROP -m comment --comment Drop-Country-UM-221
iptables -A INPUT -m set --match-set UY-222 src -j DROP -m comment --comment Drop-Country-UY-222
iptables -A INPUT -m set --match-set UZ-223 src -j DROP -m comment --comment Drop-Country-UZ-223
iptables -A INPUT -m set --match-set VU-224 src -j DROP -m comment --comment Drop-Country-VU-224
iptables -A INPUT -m set --match-set VE-225 src -j DROP -m comment --comment Drop-Country-VE-225
iptables -A INPUT -m set --match-set VN-226 src -j DROP -m comment --comment Drop-Country-VN-226
iptables -A INPUT -m set --match-set VG-227 src -j DROP -m comment --comment Drop-Country-VG-227
iptables -A INPUT -m set --match-set VI-228 src -j DROP -m comment --comment Drop-Country-VI-228
iptables -A INPUT -m set --match-set WF-229 src -j DROP -m comment --comment Drop-Country-WF-229
iptables -A INPUT -m set --match-set YE-230 src -j DROP -m comment --comment Drop-Country-YE-230
iptables -A INPUT -m set --match-set ZM-231 src -j DROP -m comment --comment Drop-Country-ZM-231
iptables -A INPUT -m set --match-set ZW-232 src -j DROP -m comment --comment Drop-Country-ZW-232

# Cleanup
rm /srv/config/country-ipset/*.txt

# Leave a 'completed' calling card.
touch /srv/config/country-ipset/completed.fyi
