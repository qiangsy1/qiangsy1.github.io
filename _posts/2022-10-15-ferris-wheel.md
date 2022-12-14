---
layout: post
title:  "摩天轮动画的实现揭秘"
categories: JavaScript
tags:  Animation
author: HyG
---

* content
{:toc}

摩天轮动画的实现揭秘

![](https://gw.alicdn.com/imgextra/i2/O1CN01WMJfsa23yty2Z4YOn_!!6000000007325-1-tps-600-329.gif)

恰好近期业务上开发了类似这样的摩天轮动画，我将其中的实现原理分享给大家。摩天轮动画主要分为 2 部分，一个是摩天轮上每个房间位置布局，另一个就是旋转动画了。


# **Strong Motion Database Center URL organized by Shengyin Qiang**

| Database name | Database code | URL  |
| :--------- | :----:  | :---- |
| Centre for Engineering Strong Motion Data |CESMD| http://www.strongmotioncenter.org/   |
| COSMOS Virtual Data Center |COSMOS| http://www.cosmos-eq.org/VDC/index.html |
| Pacific Earthquake Engineering Research Center database|PEER|  http://peer.berkeley.edu/peer_ground_motion_database |
| European Strong-Motion Database| ESMD| http://www.isesd.hi.is/ESD_Local/frameset.htm |
| European Integrated Data Archive|  EIDA|  http://eida.gfz-potsdam.de/webdc3/ |
| Italian Accelerometric Archive | ITACA| http://itaca.mi.ingv.it/ |
| Real-time INGV strong- motion data |  ISMD|  http://ismd.mi.ingv.it/ |
| Italian Strong Motion Network – RAN Download | MOT1 |  http://www.mot1.it/randownload/EN/index.php |
| Strong-motion database of Turkey | |http://kyhdata.deprem.gov.tr/2K/kyhdata_v4.php |
| HEllenic Accelerogram Database| HEAD|  http://www.itsak.gr/en/head |
| Kyoshin network and Kiban Kyoshin network |  K-NET and Kik-NET | http://www.kyoshin.bosai.go.jp/ |
| Swiss Seismological Service | SED | http://www.seismo.ethz.ch/index |
| French accelerometric network |RAP| http://www-rap.obs.ujf-grenoble.fr/ |
| The Guerrero Accelerograph Network (Mexico) | | http://crack.seismo.unr.edu/guerrero/description.html |
| GeoNet (New Zealand) | |  http://info.geonet.org.nz/display/appdata/Applications+and+Data |
| Euroseistest database (Greece)|   |http://euroseisdb.civil.auth.gr/|
| Iran Strong Motion Network | ISNM | http://www.bhrc.ac.ir/Portal/Default.aspx?tabid=635 |
| USGS National Strong- Motion Project |NSMP | http://nsmp.wr.usgs.gov/ |


