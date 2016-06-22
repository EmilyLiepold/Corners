;*********************************************************************************
; NAME:
;   c_pairdiff_1D2D_corner
;VERSION:
;   1.0
; PURPOSE:
;   Calculate the distance-dependent pair diffusion coefficients (both
;   longitudinal and transverse)counting all pairs in a bent quasi-one-dimensional channel;
;CATEGORY:
;   Data Processing
; CALLING SEQUENCE:
;   c_pairdiff_1D2D_corner
; INPUTS:
; trshort: The short trajectory files generated from c_trshort_1D2D
;OPTIONAL PARAMETERS:
; time, used to calculated short time diffusion coefficient,
;     in the unit of frame.
; maxdis, the maximum pair distance counted, in the unit of pixel.
; nframes, specify this parameter if you just want to use part of the trajectory.
; speed, the movie grabing speed, e.g. 30frames/second.
; ratio, conversion between pixel and um. 0.169um/pixel
; OUTPUTS:
;   diff_axis_all, the collective and relative coupling diffusion in
;   diff_vert_all
;   diff_avg_all
;   diff_xaxis_all
; SIDE EFFECTS:
;   None
; RESTRICTIONS:
;   Longer time at high concentration will result in curved r2 vs. time
;   which gives larger error to diffusion constant. Default is 6.
; Comments:
;   The first column of diff_axis, diff_vert is the collective
;   diffusion coefficient and second column the relative one.
;   All possible particle pairs are counted.
;   Well written program.
; MODIFICATION HISTORY:
;   Written by Bianxiao Cui on March 12th, 2005
;       Modified for bent channels by Corrigan Nadon-Nichols, 2005
;********************************************************************************

pro gr_corner,maxdis=maxdis, speed=speed, ratio=ratio, time=time, nframes=nframes, corners=corners,folder=folder,usetrfile = usetrfile


compile_opt idl2
;Set keywords if they haven't already been set
  if keyword_set(maxdis) then maxdis=maxdis else maxdis=300. ;in the unit of pixel
  if keyword_set(speed) then speed=speed else speed=30.
  if keyword_set(ratio) then ratio=ratio else ratio=0.169
  if keyword_set(time) then time=time else time=5.
  if keyword_set(corners) then corners=corners else corners=read_gdf('middles.gdf')
  if keyword_set(plot_res) then plot_res=plot_res else plot_res=maxdis

  if keyword_set(folder) then cd, folder
  fls=file_search('subset_sumdata*')
  if fls[0] eq '' then fls = !null
;  flt = findfile('trshort-6_umdata_*')
  if keyword_set(usetrfile) then flt=findfile('trshort-6_umdata_*')
  if flt[0] eq '' then flt = !null
  r2_axis=fltarr(2,maxdis,time+1)
  r2_vert=fltarr(2,maxdis,time+1)
  indicator=fltarr(maxdis,time+1)


;Fix resolution tag
resolution = 1.0

    thist = fltarr(maxdis)
    tpairs = 0


  for file=0.,n_elements(fls) + n_elements(flt)-1. do begin
    if file le n_elements(fls) -1 then begin
      print,'begin of file:  ',fls[file]
      sum=read_gdf(fls[file])
      file_id=strmid(fls[file],2,3,/REVERSE_OFFSET)
    endif else begin
      file_tr = file - (n_elements(fls))
      print,'begin of file:  ',flt[file_tr]
      sum=read_gdf(flt[file_tr])
      sum = sum[*,*,0]
      sum = [sum,sum]
      file_id=strmid(flt[file_tr],2,3,/REVERSE_OFFSET)
    endelse
;    nparticles=float(n_elements(sum[0,*,0]))
;    if keyword_set(nframes) then nframes=nframes else nframes=max(sum[5,*])+1.
;    print,nframes
    print,max(sum[5,*])+1
    nframes=max(sum[5,*])+1.
    print,nframes
    maxx = max(sum[0,*])
    minx = min(sum[0,*])
    maxy = max(sum[1,*])
    miny = min(sum[1,*])

    mask = make_array(maxx+1,maxy+1,/boolean)



    ;print,file_id
    if(strmid(file_id,0,1) eq '_') then file_id=strmid(file_id,1,2)
    chan=file_id MOD 10
    m=(file_id-chan)/10
    print,chan,m
    corner=corners[m,chan]
    ;recalulate coorndinates in channel
    ;trshort[0:1,*,*]=[(trshort[1,*,*]-corner[1])/sin(angle/2*(!dpi/180)), (trshort[0,*,*]-abs(trshort[1,*,*]-corner[1])/tan(angle/2*(!dpi/180)))*sin(angle/2*(!dpi/180))]
    ;window,file+10
    ;plot,trshort[0,*,[0,100,400]],trshort[1,*,[0,100,400]],psym=3

    ;Create list indices with frame number and position(l,r)
    index = list()

    hist=fltarr(maxdis)
    pairs = 0
    xx=findgen(maxdis)*resolution*ratio  ;in the unit of diameter

    for i=0,nframes do begin
      index.add,list(length=0)
      for j=0,1 do begin
        (index[i]).add,list(length=0)
      endfor
    endfor
    
    for k =0, n_elements(sum[0,*])-1 do begin
      if sum[0,k] lt corner then index[sum[5,k],0].add,k else index[sum[5,k],1].add,k
    endfor
    print,'Indexed!'
    
;    for k=0,nframes do begin
;      w = index[k,0].toarray()
;      v = index[k,1].toarray()
;      plot,sum[0,w],sum[1,w],psym=3,xrange=[minx,maxx],yrange=[miny,maxy],symsize=5, color='FFFFFF'x
;      oplot,sum[0,v],sum[1,v],psym=3,symsize=5, color='0000FF'x
;      wait, 0.01
;    endfor
    midy = mean(sum[1,*])
    H = 6 ;Set an actual H!
;    stop

;Find the normalized bit

mask[sum[0,*],sum[1,*]] += 1
maskr = mask[corner:-1,*]
maskl = mask[0:corner,*]
O = where(maskl[*,*] eq 1)
P = where(maskr[*,*] eq 1)
normhist=fltarr(maxdis)
lmax = [n_elements(maskl[*,0]), n_elements(maskl[0,*])]
rmax = [n_elements(maskr[*,0]), n_elements(maskr[0,*])]

norms = make_array(n_elements(mask[*,0]),n_elements(mask[0,*]),maxdis,2)
norms[*,*,*,0] = 10
norms[*,*,*,1] = -10

for m = 0,n_elements(O)-1 do begin
  l = [O[m] mod lmax[0], O[m] / lmax[0]] / resolution
  for n = 0, n_elements(P)-1 do begin
    r = [P[n] mod rmax[0], P[n] / rmax[0]] / resolution
    dis=sqrt((r[0] + corner - l[0] )^2 + (r[1]-l[1])^2)
    dis=fix(abs(dis),type=3)
    if dis le maxdis-1 then begin
      thetalr = atan(r[1]-l[1],r[0]+corner-l[0])
      thetarl = -thetalr
;      print,theta
      if thetalr lt norms[l[0],l[1],dis,0] then norms[l[0],l[1],dis,0] = thetalr
      if thetalr gt norms[l[0],l[1],dis,1] then norms[l[0],l[1],dis,1] = thetalr
      if thetarl lt norms[r[0]+corner,r[1],dis,0] then norms[r[0]+corner,r[1],dis,0] = thetarl
      if thetarl gt norms[r[0]+corner,r[1],dis,1] then norms[r[0]+corner,r[1],dis,1] = thetarl
    endif


;    if dis le maxdis-1 then normhist[dis]=normhist[dis]+1
  endfor
endfor

w = where(norms[*] eq -10)
norms[w] = 0
w = where(norms[*] eq 10)
norms[w] = 0
fixnorms = (norms[*,*,*,1] - norms[*,*,*,0]) / (2 * !Pi)
;stop


    for fr=0,nframes-1 do begin
;      print,fr
;      print,'frame: '+strtrim(fr,0)
;      print,nframes
      lindices = index[fr,0].toarray()
      rindices = index[fr,1].toarray()
      count_l = n_elements(lindices)
      count_r = n_elements(rindices)
      if (n_elements(rindices) gt 0) && (n_elements(lindices) gt 0) then begin
        mask[sum[0,lindices],sum[1,lindices]] += 1
        mask[sum[0,rindices],sum[1,rindices]] += 1
        
        

              
  ;      npar=npar+count_l + count_r
        pairs=pairs+count_l * count_r
        x_l=reform(sum[0,lindices])/resolution
        y_l=reform(sum[1,lindices])/resolution
        x_r=reform(sum[0,rindices])/resolution
        y_r=reform(sum[1,rindices])/resolution
  
        for i=0,count_l-1 do begin
          for j=0,count_r-1 do begin
            dis=sqrt((x_r[j]-x_l[i])^2+0 * (y_r[j]-y_l[i])^2)
            dx = abs(x_r[j] - x_l[i])
            yr = abs(y_r[j] - midy)
            yl = abs(y_l[i] - midy)
            dis=fix(abs(dis),type=3)
            if dis le maxdis-1 then hist[dis]=hist[dis]+(fixnorms[x_l[i],y_l[i],dis] + fixnorms[x_r[j],y_r[j],dis]) / 2
          endfor
        endfor
      
    endif 
      
    endfor  ;end of fr loop
    

    
;    stop
    
    

    histnorm = mean(hist)
    print,'the mean value on the histogram is:'
    print,histnorm
    print,count_l,count_r
    print,'There are '+strtrim(pairs,2) + ' pairs'
    if histnorm gt 0 then begin
          plot,xx,hist/histnorm

    gr=[transpose(xx),transpose(hist/histnorm)]
    write_gdf,gr,'gr/gr_' + file_id
    endif
    thist += hist
    tpairs += pairs
;stop

  endfor  ;end of file loop

  thistnorm = mean(thist)
  
  print,'the mean value on the histogram is:'
  print,thistnorm

  print,'There are '+strtrim(tpairs,2) + ' pairs'
  plot,xx,thist/thistnorm

  gr=[transpose(xx),transpose(thist/thistnorm)]

  write_gdf,gr,'gr/gr_total'




end
