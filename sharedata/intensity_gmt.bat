

gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set FONT Times-Roman
gmt set FONT_ANNOT_PRIMARY=8,Times-Roman
gmt set MAP_FRAME_TYPE fancy
gmtset MAP_FRAME_WIDTH=2p

set R=28/34/39/42
set C=1/9/0.05
set J=M8c

gmt begin intensity jpg

gmt basemap -R%R% -J%J% -Baf -BWSen+t"仪器地震烈度分布图" --FONT_TITLE=8p,40,black  --MAP_TITLE_OFFSET=0c
gmt makecpt -Chot -T%C% -Z -Iz -D -H > h.cpt

gmt grdcut @earth_relief_15s  -Gtopo.grd -R%R%
gmt grdgradient -R%R% topo.grd -Nt -A0 -Gdem.grad
gmt surface intensity.txt -Gintensity.grd -R%R% -I15s/15s -T0.2 
grdsample dem.grad -GNEW.grad -T  
gmt grdimage -R%R% intensity.grd -Ch.cpt -INEW.grad
rem  ---------
gmt grdcontour intensity.grd -C8 -Gn1/1c -L8/8.1 -Bwsen -W0.5p,blue -A+f9p
gmt grdcontour intensity.grd -C6 -Gn1/1c -L6/6.1 -Bwsen -W0.5p,blue -A+f9p
gmt grdcontour intensity.grd -C4 -Gn1/1c -L4/4.1 -Bwsen -W0.5p,blue -A+f9p

gmt coast -R%R% -J%J% -Df -Ba1f1 -BWSne -W0.25p -A -Slightskyblue1
gmt plot epicenter.txt  -Sa0.15i -Gcyan -W0.5p,black

gmt colorbar -DjBL+w8c/0.25ch+o0i/-0.4i -Ch.cpt -G%C% -I -B1+l"仪器地震烈度"  --FONT_LABEL=8p,40,black
gmt end
del  *.history *.conf *.grd *.grad *.cpt
