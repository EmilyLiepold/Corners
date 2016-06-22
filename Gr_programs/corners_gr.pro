;*************************************************************
;NAME:
;	c_gr_1D2D
;VERSION:
;	1.0
;PURPOSE:
;	calculate the pair correlation function in a pseudeo one-dimensional channel
;	Particles can have move significantly off the center of channel.
;CATERGORY:
;	data processing
;CALLING SEQUENCE:
;	c_gr_1D2D,sumdata_mv=sumdata_mv,resultion=resolution,maxdis=maxdis,
;		diameter=diameter,ratio=ratio,nframes=nframes
;INPUT:
;	The program will automatically search for all the sumdata file in the working foler
;	assuming all the sumdata files belongs to same set of data (same density).
;OPTIONAL PARAMETERS:
;	sumdata_mv: if only one sumdata is desired instead of all the sumdata files in the folder.
;	resultion: the binsize of the calculated gx, default 0.1 pixel.
;	maxdis: the maximum distance of the calculated gx, default 12*diameter.
;	diameter: the diameter of the particles, defaul 1.58um.
;	ratio: microscope resultion in the unit of um/pixel, default 0.169.
;	nframes: only specify this parameter if you want to process only subset of the data.
;COMMENTS:
;	this program is a modification from c_gx_1D.pro.
;	It's impossible to calculate the theoretical two-point distance distribution
;	in a rectangular area, so there is a small simulation inside this program
;	to calculate the normalization factor.
;PROGRAM HISTORY:
;	Created by Bianxiao Cui in Feb. 20 2005.
;******************************************************************

pro corners_gr,sumdata_l,sumdata_r,resolution=resolution,$
       maxdis=maxdis,diameter=diameter,ratio=ratio,nframes=nframes
if keyword_set(diameter) then diameter=diameter $
   else diameter=1.58  ; in the unit of um
if keyword_set(ratio) then ratio=ratio $
   else ratio=0.169
if keyword_set(nframes) then nframes=nframes $
   else nframes=5000.
if keyword_set(sumdata_mv) then file=findfile(sumdata_mv) $
   else file=findfile('sum*')
nfiles=n_elements(file)
print,'the number of sumdata files found:',nfiles
if keyword_set(resolution) then resolution=resolution $
 else resolution=0.1                ;in the unit of pixel
if keyword_set(maxdis) then maxdis=maxdis*diameter/ratio $
  else maxdis=diameter*8./ratio     ;8 times of the diameter
maxdis=float(maxdis)/resolution  ;the points in the gr file
hist=fltarr(maxdis)
print,'the max distance of gr is:',maxdis*resolution*ratio
      ;in the unit of um
xx=findgen(maxdis)*resolution*ratio/diameter	;in the unit of diameter
npar=0.
npairs=0.
total_nf=0.

nfr= max(sumdata_l[2,*])+1.
total_nf=nfr

  for f=0,nfr-1 do begin
      w=where(sumdata_l[2,*] eq f,count_l)
      v=where(sumdata_r[2,*] eq f,count_r)
        npar=npar+count_l + count_r
        npairs=npairs+count_l * count_r
        x_l=reform(sumdata_l[0,w])/resolution
        y_l=reform(sumdata_l[1,w])/resolution
        x_r=reform(sumdata_r[0,v])/resolution
        y_r=reform(sumdata_r[1,v])/resolution

        for i=0,count_l-1 do begin
            for j=0,count_r-1 do begin
                  dis=sqrt((x_r[j]-x_l[i])^2+(y_r[j]-y_l[i])^2)
                  dis=fix(abs(dis),type=3)
                  if dis le maxdis-1 then hist[dis]=hist[dis]+1.
             endfor
         endfor
     endfor
 ;write_gdf,[transpose(xx),hist[nf,*]],'gr_'+strmid(file(nf),8)


;-------------------------------------------------------------------------------------------
; min_x=min(sumdata[0,*])/resolution
; max_x=max(sumdata[0,*])/resolution
; xrange=max_x-min_x
; xrange2=xrange^2
; min_y=min(sumdata[1,*])/resolution
; max_y=max(sumdata[1,*])/resolution
; yrange=max_y-min_y
; yrange2=yrange^2
; random_seed=29845

; simu_hist=fltarr(maxdis)
; for f=0.,5000000. do begin
; 	dis=sqrt((randomu(seed)-randomu(seed))^2*xrange2+(randomu(seed)-randomu(seed))^2*yrange2)
; 	if dis le maxdis-1 then simu_hist[dis]=simu_hist[dis]+1.
; endfor
;-------------------------------------------------------------------------------------------

;hist=total(hist,1)
histnorm = mean(hist)
plot,xx,hist/histnorm

gr=[transpose(xx),transpose(hist/histnorm)]

write_gdf,gr,'gr_total'

end
