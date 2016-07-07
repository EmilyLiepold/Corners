


pro batch_gr
  folders = ['/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.30',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.40',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.50',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.60',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape16/subsum',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.2',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.3',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.4',$
    ;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape31/phi=.5',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.6',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.8',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.4',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.5',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.6',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.2',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.3',$
    ;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.2/opposite sides', $
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.3/opposite sides', $
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.4/opposite sides', $
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.5/opposite sides', $
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.6/opposite sides', $
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=.2',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=0.3', $
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.5/opposite sides',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.4/opposite sides',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape9/corner_subsets/subsets',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tape33/eta=0.3/opposite sides',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tapet/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tape42/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape32/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_3um/tape44/eta=0.3/both sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_3um/tape44/eta=0.5/both sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.3/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.5/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.7/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.9/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.3;phi=.24/opposite sides/',$
  ;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.6;phi=.48/opposite sides/',$
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.8;phi=.64/opposite sides/',$
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.9;phi=.72/opposite sides/',$
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.0;phi=.8/opposite sides/',$
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.1;phi=.88/opposite sides/',$
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.2;phi=.96/opposite sides/',$
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape32/eta=0.3/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.3/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.5/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.7/opposite sides/',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.9/opposite sides',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=1.0/opposite sides' ]
;folders = [  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape9/corner_subsets/subsets',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tape33/eta=0.3/opposite sides',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tapet/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_3um/tape42/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape32/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_3um/tape44/eta=0.3/both sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_3um/tape44/eta=0.5/both sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.3/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.5/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.7/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/120deg_5um/tape45/eta=0.9/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.3;phi=.24/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.6;phi=.48/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.8;phi=.64/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.9;phi=.72/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.0;phi=.8/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.1;phi=.88/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=1.2;phi=.96/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape32/eta=0.3/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.3/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.5/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.7/opposite sides/',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=0.9/opposite sides',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/60deg_5um/tape41/eta=1.0/opposite sides'];,$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/smooth/3 um 60 deg',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/smooth/5 um 60 deg']


;Done
;folders = ['/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.30',$
;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.40',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.50',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.60',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape16/subsum',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.2',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.3',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.4',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape31/phi=.5',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.6',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.8',$
;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.4',$
;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.5',$
;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.6',$
;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.2',$
;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.3',$
;'/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.2/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.3/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.4/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.5/opposite sides', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.6/opposite sides', $
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=.2',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=0.3', $
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.5/opposite sides',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.4/opposite sides']

nf = n_elements(folders)
cd,current=maindir

for i=0,nf-1 do begin
  cd,folders[i]
  f = file_search('gr')
;  m = file_search('middles.gdf')
;  if m eq '' then print,folders[i]
  if f eq '' then file_mkdir,'gr'
  
;  gr_corner, maxdis=125,/usetrfile
;   gr_corner_1d
  corners_stack,/usetrfile
  gr_corner_revision,data='sumdata_collection',/newformat,maxdis=15,resolution=100
  
endfor

batch_gr_plot


cd,maindir











end