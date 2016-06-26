



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
    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.4/opposite sides']
    
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
    [60,3,0.40,0]]
    
for i=0,n_elements(folders) -1 do begin
  cd,folders[i]
  print,folders[i]
  line = reform(vals[*,i])
  write_gdf,line,'gr/gr_metadata'
  
endfor




















end