---
layout: post
title:  "绘制地震动强度参数分布图"
categories: GMT
tags:  plot
author: qiangsy
---

* content
{:toc}

## **地震烈度分布图**<br/>

### 绘图效果如图
<div align='center'><img src="/picture/intensity.jpg" width="60%"></div>

### 设置GMT配置参数的值
```
gmt begin intensity jpg

   rem 设置GMT配置参数的值
   gmt set FORMAT_GEO_MAP ddd:mm:ssF
   gmt set FONT Times-Roman
   gmt set FONT_ANNOT_PRIMARY=8,Times-Roman
   gmt set MAP_FRAME_TYPE fancy
   gmt set MAP_FRAME_WIDTH=2p
```
```
   set R=28/34/39/42
   set C=1/9/0.05
   set J=M8c
```
```
   rem 使用中文图例是要注意三个问题： 1.配置Windows 下的 GMT 中文支持； 2.使用中文字体； 3. bat脚本需要修   改为GB2312
   gmt basemap -R%R% -J%J% -Baf -BWSen+t"仪器地震烈度分布图" --FONT_TITLE=8p,40,black    --MAP_TITLE_OFFSET=0c
   gmt makecpt -Chot -T%C% -Z -Iz -D -H > h.cpt
   rem 截取地形数据，计算输入地形数据的梯度作为光照强度文件
   gmt grdcut @earth_relief_15s  -Gtopo.grd -R%R%
   gmt grdgradient -R%R% topo.grd -Nt -A0 -Gdem.grad
   
   rem 采用surface对烈度对数据进行网格化
   rem Note: surface插值的网格精度要跟地形数据相匹配，这里都是15s
   gmt surface intensity.txt -Gintensity.grd -R%R% -I15s/15s -T0.35 
   rem 网格线配准，则输出为像素点配准
   gmt grdsample dem.grad -GNEW.grad -T
   rem 绘制网格数据，-I将地形梯度设为光照效果
   gmt grdimage -R%R% intensity.grd -Ch.cpt -INEW.grad
   rem 根据grd数据绘制等值线
   gmt grdcontour intensity.grd -C8 -Gn1/1c  -Bwsen -W0.5p,blue -A+f9p
   gmt grdcontour intensity.grd -C6 -Gn1/1c  -Bwsen -W0.5p,blue -A+f9p
   gmt grdcontour intensity.grd -C4 -Gn1/1c  -Bwsen -W0.5p,blue -A+f9p
   rem coast将湖泊，海洋填充为淡蓝色
   gmt coast -R%R% -J%J% -Df -Ba1f1 -BWSne -W0.25p -A -Slightskyblue1
   echo 31.025 40.823 | gmt plot epicenter.txt  -Sa0.15i -Gcyan -W0.5p,black
   
   gmt colorbar -DjBL+w8c/0.25ch+o0i/-0.4i -Ch.cpt -G%C% -I -B1+l"仪器地震烈度"  --FONT_LABEL=8p,40, black
gmt end show
del *.history *.conf *.grd *.grad *.cpt
```

### 完整代码
**[Main script]**</sahredata/intensity_gmt.bat><br>
**[intensity data]**<intensity.txt>
