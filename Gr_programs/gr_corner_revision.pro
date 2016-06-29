;*********************************************************************************
; NAME:
;   gr_corner_1d
;VERSION:
;   1.0
; PURPOSE:
;   Calculate the pair distribution function [ g(r) ] for the corner geometry
;   from linearized sumdata or trackfiles (subset-sumdata)
;CATEGORY:
;   Data Processing
; CALLING SEQUENCE:
;   gr_corner_1d
; INPUTS:
; straightened subsum_sumdata or trackfile
;OPTIONAL PARAMETERS:
; time, used to calculated short time diffusion coefficient,
;
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



pro gr_corner_revision,maxdis=maxdis, speed=speed, ratio=ratio, time=time, $
  nframes=nframes, corners=corners,folder=folder,usetrfile = usetrfile, $
  resolution=resolution,diameter=diameter,data = data,newformat=newformat


  compile_opt idl2
  
  ;Set keywords if they haven't already been set
  
  if keyword_set(maxdis) then maxdis=maxdis else maxdis=40. ;in units of sigma
  
  if keyword_set(speed) then speed=speed else speed=30.
  
  if keyword_set(ratio) then ratio=ratio else ratio=0.169
  
  if keyword_set(time) then time=time else time=5.
  
  if keyword_set(resolution) then resolution=resolution else resolution = 100.
  
  if keyword_set(diameter) then diameter=diameter else diameter=1.57
  
  if keyword_set(corners) then corners=corners $
     else corners=read_gdf('middles.gdf')
     
  if keyword_set(plot_res) then plot_res=plot_res else plot_res=maxdis

  ;Locate files and remove variable if none are found
  if keyword_set(folder) then cd, folder
  
  if keyword_set(data) then fls=file_search(data) else begin
  
  fls=file_search('subset_sumdata*')
  if fls[0] eq '' then fls = !null
  
  flt=findfile('trshort-6_umdata_*')
  if flt[0] eq '' then flt = !null
  
  ;If we don't want trfiles, exclude trfiles
  if ~keyword_set(usetrfile) then flt=!null
  
  endelse

  ;Initialize final histograms
  thist = fltarr(maxdis)
  tpairs = 0

  ;  corners = corners * resolution * ratio / diameter
  maxdis = maxdis * resolution


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
    
    sum[0:1,*] = sum[0:1,*] * resolution * ratio / diameter

  if ~keyword_set(newformat) then sum[2,*] = sum[5,*] 



    print,max(sum[2,*])+1
    nframes=max(sum[2,*])+1.
    print,nframes
    maxx = max(sum[0,*])
    minx = min(sum[0,*])
    maxy = max(sum[1,*])
    miny = min(sum[1,*])

    mask = make_array(maxx+1,maxy+1,/boolean)

    hist=fltarr(maxdis)
    dis_list = list(length=0)
    normhist=fltarr(maxdis)
    pairs = 0
    xx=findgen(maxdis) / resolution;*ratio / diameter  ;in the unit of diameter


    newframe = (sum[2,*] - shift(sum[2,*],0,1))
    ww = where(newframe[*] eq 1) 
    newframelist = [0.,ww]
    n = intarr(nframes)
    for k=0,nframes-2 do begin
      n[k] = newframelist[k+1]-newframelist[k]
    endfor



    for fr=0,nframes-2 do begin
      if fr mod 1000 eq 0 then print,fr
      w = indgen(n[fr])+newframelist[fr]
      ll = where(sum[0,w[*]] lt 0,complement = rr)
      lindices = w[ll]
      rindices = w[rr]
      count_l = n_elements(lindices)
      count_r = n_elements(rindices)
      if (n_elements(rindices) gt 0) && (n_elements(lindices) gt 0) then begin
        pairs=pairs+count_l * count_r
        x_l=reform(sum[0,lindices]);/resolution
        x_r=reform(sum[0,rindices]);/resolution
        x_l_k = replicate(1,count_r)
        x_r_k = replicate(1,count_l)
        diss =  fix(x_r_k#x_r - x_l#x_l_k)
        diss = [diss[*],0]
        dish = histogram(diss)
        
        hist[0] = hist[*] + dish[*]

      endif

    endfor  ;end of fr loop



    lindices = where(sum[0,*] lt 0,complement = rindices)
    count_l = n_elements(lindices)
    count_r = n_elements(rindices)
    nsample = 10000
    lefts = count_l * randomu(Seed,nsample)
    rights = count_r * randomu(Seed,nsample)
      x_l=reform(sum[0,lindices[lefts]]);/resolution
      x_r=reform(sum[0,rindices[rights]]);/resolution

      
  for i=0,nsample-1 do begin
  
    ndiss = x_r - x_l[i]
    ndiss = fix([ndiss,0])
    ndish = histogram(ndiss)
    normhist[0] = normhist[*] + ndish[*] 
  
    
  endfor
  
  hist = hist[1:-1]
  normhist = normhist[1:-1]
  xx = xx[1:-1]
  
  ratio = hist / (normhist + 1.0)

    histnorm = mean(ratio)
    ratio = ratio / histnorm
    print,'the mean value on the histogram is:'
    print,histnorm
;    print,count_l,count_r
    print,'There are '+strtrim(pairs,2) + ' pairs'
    if histnorm gt 0 then begin
      p = plot(xx,ratio)

      gr=[transpose(xx),transpose(ratio)]
;      write_gdf,gr,'gr/gr_' + file_id
    endif
;    thist += hist
;    tpairs += pairs
;    ;stop

  endfor  ;end of file loop

;  thistnorm = mean(thist)
;
;  print,'the mean value on the histogram is:'
;  print,thistnorm
;
;  print,'There are '+strtrim(tpairs,2) + ' pairs'
;  plot,xx,thist/thistnorm
;;
;  gr=[transpose(xx),transpose(thist/thistnorm)]

  write_gdf,gr,'gr/gr_total'




end
