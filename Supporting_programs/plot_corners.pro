

pro plot_corners

diameter = 1.57
  folders = [ $ ;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=.2',$
    ;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=0.3', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.30',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.40',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.50',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.60',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape16/subsum',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.2',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.3',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.4',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape31/phi=.5',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.6',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.8',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.4',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.5',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.6',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.2',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.3',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.2/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.3/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.4/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.5/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.6/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=0.3', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.5/opposite sides',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.4/opposite sides',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape9/corner_subsets/subsets',$
;     '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tape33/eta=0.3/opposite sides',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tapet/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tape42/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape32/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_3um/tape44/eta=0.3/both sides/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_3um/tape44/eta=0.5/both sides/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.3/opposite sides/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.5/opposite sides/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.7/opposite sides/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.9/opposite sides/',$
;      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.3;phi=.24/opposite sides/',$
;;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.6;phi=.48/opposite sides/',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.8;phi=.64/opposite sides/',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.9;phi=.72/opposite sides/',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.0;phi=.8/opposite sides/',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.1;phi=.88/opposite sides/',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.2;phi=.96/opposite sides/',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape32/eta=0.3/opposite sides/',$
      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.3/opposite sides/',$
      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.5/opposite sides/',$
      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.7/opposite sides/',$
      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.9/opposite sides',$
      '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=1.0/opposite sides' ]


for k= 0,n_elements(folders)-1 do begin
  cd,folders[k]
  


  corners=read_gdf('middles.gdf')

  fls=file_search('subset_sumdata*')
  flt=file_search('trshort-6_umdata_*')
  if fls[0] eq '' then fls = !null
  if flt[0] eq '' then flt = !null
;  if ~keyword_set(usetrfile) then flt=!null

  files = [fls,flt]
  bigsum = [0.,0.,0.,0.]
  frame_track = 0
  for file=0.,n_elements(files) -1. do begin
    sum = read_gdf(files[file]) 
    file_id=strmid(files[file],2,3,/REVERSE_OFFSET)
    if(strmid(file_id,0,1) eq '_') then file_id=strmid(file_id,1,2)
    chan=file_id MOD 10
    m=(file_id-chan)/10
    print,chan,m
    corner=corners[m,chan]
    sum[0,*] -= corner
    midy = mean(sum[1,*])
    sum[1,*] -= midy
    if file gt n_elements(fls) -1 then begin
      sum = sum[*,*,0]
      sum = [sum,sum]
    endif
    nf = max(sum[5,*])
    sum[5,*] += frame_track

    plot,sum[0,*],sum[1,*],psym=3;,xrange = [-10 * diameter,10* diameter]
;    js = [0]
;    meany = [0]
;    for j = min(fix(sum[0,*])),max(fix(sum[0,*])) do begin
;;      print,j
;      w = where(fix(sum[0,*]) eq j)
;      js = [js,j]
;;      print,n_elements(w)
;      meany = [meany,mean(sum[1,w])]
;    endfor
;    oplot,js[1:-1],meany[1:-1],thick=4
;    print,meany
;    frame_track += nf
;    id = sum[0,*] * 0. + file_id
;    if file eq 0 then plot,sum[0,*],sum[1,*],psym=3 else oplot,sum[0,*],sum[1,*],psym=3
;    newsum = make_array(4,n_elements(sum[0,*]))
;    newsum[0:1,*] = sum[0:1,*]
;    newsum[2,*] = sum[5,*]
;    newsum[3,*] = id[*]
;    bigsum = [[bigsum],[newsum]]
;  k = image(hist_2d(sum[0,*],sum[1,*]))
    wait,0.5
  endfor

;  k = image(hist_2d(bigsum[0,*],bigsum[1,*]))


  ;  stop

;  write_gdf,bigsum,'sumdata_collection'



endfor








end