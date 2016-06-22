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

pro gr_corner_1d,maxdis=maxdis, speed=speed, ratio=ratio, nframes=nframes, $
   corners=corners,folder=folder,usetrfile = usetrfile, sigma = sigma, $
   resolution = resolution


compile_opt idl2
;Set keywords if they haven't already been set
  if keyword_set(maxdis) then maxdis=maxdis $
    else maxdis=5. ;in the unit of particle diameters 
  if keyword_set(speed) then speed=speed else speed=30.
  if keyword_set(ratio) then ratio=ratio else ratio=0.169 ; um / px
  if keyword_set(corners) then corners=corners $
    else corners=read_gdf('middles.gdf')
  if keyword_set(sigma) then sigma = sigma else sigma = 1.57 ;In um
  if keyword_set(resolution) then resolution = resolution else $
    resolution = 30. ;# of points per particle diameter

  if keyword_set(folder) then cd, folder
  fls=file_search('subset_sumdata*')
  if fls[0] eq '' then fls = !null
  flt = findfile('trshort-6_umdata_*')
;  if keyword_set(usetrfile) then flt=findfile('trshort-6_umdata_*')
  if flt[0] eq '' then flt = !null

    ;Correct maxdis and corners to non-dimensionalise:
    maxdis = maxdis * resolution
    corners = corners * ratio / sigma * resolution

    thist = fltarr(maxdis)
    tpairs = 0


  for file=0.,n_elements(fls) + n_elements(flt)-1. do begin
;    Load the file and correct formatting
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

;   Move positions to complex array  with xy = x + iy
    xy = complex(reform(sum[0,*]),reform(sum[1,*]))
    xy = xy * ratio / sigma * resolution
    xx=findgen(maxdis) / resolution  ;in the unit of diameter
    frs = sum[5,*]
    sum = !Null
    
    

    nframes=max(frs)+1.

    if(strmid(file_id,0,1) eq '_') then file_id=strmid(file_id,1,2)
    chan=file_id MOD 10
    m=(file_id-chan)/10
;    print,chan,m
    corner=corners[m,chan]

    ;Initialise histogram and axis
    hist=fltarr(maxdis)
    pairs = 0

    ;Initialise index
    index = list()
    for j=0,1 do begin
      index.add,list(length=0)
      for i=0,nframes do begin
      (index[j]).add,list(length=0)
;      for j=0,1 do begin
;        (index[i]).add,list(length=0)
;      endfor
      endfor
    endfor
;    stop
    ;Populate index
    print,'Starting Index!'
    w = where(real_part(xy[*]) lt corner,complement = v)
    foreach element, w do index[0,frs[element]].add,element
    foreach element, v do index[1,frs[element]].add,element
    print,'Indexed!'
    
    for fr=0,nframes-1 do begin
      ;Choose the two sets of indices and find their lengths
      lindices = index[0,fr];.toarray()
      rindices = index[1,fr];.toarray()
      count_l = n_elements(lindices)
      count_r = n_elements(rindices)
      newpairs = count_l * count_r
      if newpairs gt 0 then begin
        pairs = pairs + newpairs
;        print,'goose!'
        for l=0,count_l-1 do begin
          for n=0,count_r-1 do begin
            dis = real_part(xy[rindices[n]] - xy[lindices[l]])
            if dis le maxdis-1 then hist[dis]=hist[dis]+1. / dis
          endfor
        endfor
      
    endif 
      
    endfor  ;end of fr loop
    

    
;    stop
    
    

    histnorm = mean(hist)
;    print,'the mean value on the histogram is:'
;    print,histnorm
    print,count_l,count_r
    print,'There are '+strtrim(pairs,2) + ' pairs'
    if histnorm gt 0 then begin
          plot,xx,hist

    gr=[transpose(xx),transpose(hist)]
    write_gdf,gr,'gr/gr_1d_' + file_id
    endif
    thist += hist
    tpairs += pairs
;stop

  endfor  ;end of file loop

  thistnorm = mean(thist)
  
  print,'the mean value on the histogram is:'
  print,thistnorm

  print,'There are '+strtrim(tpairs,2) + ' pairs'
  plot,xx,thist;/thistnorm

  gr=[transpose(xx),transpose(thist)]

  write_gdf,gr,'gr/gr_1d_total'




end
