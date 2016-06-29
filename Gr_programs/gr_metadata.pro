



pro place_gr_metadata

  folders = ['/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.30',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.40',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.50',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.60',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape16/subsum',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.2',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.3',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.4',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape31/phi=.5',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.6',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.8',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.4',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.5',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.6',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.2',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.3',$
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.2/opposite sides', $
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
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Smooth_corners/90deg_5um/tape 36/eta=.6;phi=.48/opposite sides/',$
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
    
    vals = [[90,30,.30,0],$
    [90,3,0.40,0],$
    [90,3,0.50,0],$
    [90,3,0.60,0],$
    [90,3,2.00,0],$
    [90,5,0.20,0],$
    [90,5,0.30,0],$
    [90,5,0.40,0],$
    [90,5,0.50,0],$
    [120,3,0.60,0],$
    [120,3,0.80,0],$
    [60,3,0.40,0],$
    [60,3,0.50,0],$
    [60,3,0.60,0],$
    [60,5,0.20,0],$
    [60,5,0.30,0],$
    [120,3,0.20,0], $
    [120,3,0.30,0], $
    [120,3,0.40,0], $
    [120,3,0.50,0], $
    [120,3,0.60,0], $
    [120,5,0.20,0],$
    [120,5,0.30,0],$
    [60,3,0.50,0],$
    [60,3,0.40,0],$
        [120,3,2.0,0],$
        [60,3,0.30,1],$
        [60,3,2.0,1],$
        [60,3,2.0,1],$
        [60,3,2.0,1],$
        [120,3,0.30,1],$
        [120,3,0.50,1],$
        [120,5,0.30,1],$
        [120,5,0.50,1],$
        [120,5,0.70,1],$
        [120,5,0.90,1],$
        [90,5,0.24,1],$
        [90,5,0.48,1],$
        [90,5,0.64,1],$
        [90,5,0.72,1],$
        [90,5,0.80,1],$
        [90,5,0.88,1],$
        [90,5,0.96,1],$
        [60,5,0.30,1],$
        [60,5,0.30,1],$
        [60,5,0.50,1],$
        [60,5,0.70,1],$
        [60,5,0.90,1],$
        [60,5,1.00,1]]
    
for i=0,n_elements(folders) -1 do begin
  cd,folders[i]
  print,folders[i]
  line = reform(vals[*,i])
  write_gdf,line,'gr/gr_metadata'
  
endfor




















end