




pro batch_gr_plot

plotdir = '/Users/sphere4/Desktop/Chris Ryan Corners/Data/Plots/'
cd,plotdir

;folders = ['/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.30',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.40',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.50',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.60',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape16/subsum',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.2',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.3',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape11/phi=.4',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_5um/30fps/Tape31/phi=.5',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.6',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape21/eta=.8',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.4',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.5',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape23/eta=.6',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.2',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_5um/30fps/Tape7/phi=.3',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.2/opposite sides', $
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.3/opposite sides', $
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.4/opposite sides', $
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.5/opposite sides', $
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_3um/30fps/Tape24/eta=.6/opposite sides', $
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=.2',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=0.3', $
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.5/opposite sides',$
;  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/60_3um/30fps/Tape27/eta=.4/opposite sides']



  folders = [  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=.2',$
;    '/Users/sphere4/Desktop/Chris Ryan Corners/Data/120_5um/30fps/Tape10/eta=0.3', $
  '/Users/sphere4/Desktop/Chris Ryan Corners/Data/90_3um/30fps/Tape14/eta=.30',$
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

  names = ['120, 5um, 20%, sharp',$
;    '120, 5um, 30%',$
    '90, 3um, 30%, sharp',$
    '90, 3um, 40%, sharp',$
    '90, 3um, 50%, sharp',$
    '90, 3um, 60%, sharp',$
    '90, 3um, 85%, sharp',$
    '90, 5um, 20%, sharp',$
    '90, 5um, 30%, sharp',$
    '90, 5um, 40%, sharp',$
    '90, 5um, 50%, sharp',$
    '120, 3um, 60%, sharp',$
    '120, 3um, 80%, sharp',$
    '60, 3um, 40%, sharp',$
    '60, 3um, 50%, sharp',$
    '60, 3um, 60%, sharp',$
    '60, 5um, 20%, sharp',$
    '60, 5um, 30%, sharp',$
    '120, 3um, 20%, sharp',$
    '120, 3um, 30%, sharp',$
    '120, 3um, 40%, sharp',$
    '120, 3um, 50%, sharp',$
    '120, 3um, 60%, sharp',$
    '120, 5um, 30%, sharp',$
    '60, 3um, 50%, sharp',$
    '60, 3um, 40%, sharp',$
    '120, 3um, --%, sharp',$
    '60, 3um, 30%, smooth',$
    '60, 3um, --%, smooth',$
    '60, 3um, --%, smooth',$
    '60, 3um, --%, smooth',$
    '120, 3um, 30%, smooth',$
    '120, 3um, 50%, smooth',$
    '120, 5um, 30%, smooth',$
    '120, 5um, 50%, smooth',$
    '120, 5um, 70%, smooth',$
    '120, 5um, 90%, smooth',$
    '90, 5um, 24%, smooth',$
    '90, 5um, 48%, smooth',$
    '90, 5um, 64%, smooth',$
    '90, 5um, 72%, smooth',$
    '90, 5um, 80%, smooth',$
    '90, 5um, 88%, smooth',$
    '90, 5um, 96%, smooth',$
    '60, 5um, 30%, smooth',$
    '60, 5um, 30%, smooth',$
    '60, 5um, 50%, smooth',$
    '60, 5um, 70%, smooth',$
    '60, 5um, 90%, smooth',$
    '60, 5um, 100%, smooth']
;stop

  nf = n_elements(folders)
  cd,current=maindir

;  for i=0,nf-1 do begin
;    cd,folders[i]+'/gr/'
;    f = file_search('gr_total')
;    if f eq '' then continue
;    
;    gr = read_gdf(f)
;    p1 = plot(gr[0,*],gr[1,*],title='Pair Distribution G(r) for pairs across corner, '+ names[i],xtitle='Distance (sigma)', ytitle='G(r) (unitless)',thick=3,name = names[i],dimensions=[1200,900])
;    p1.save,names[i] + '.png'
;    p1.save,plotdir + names[i] + '.png'
;    p1.close
;    
;    
;    
;  endfor

;Hack to fix diameters
;diameter = 1.57
;  
;;groups = list([12,13,14,15,16,23,24],[1,2,3,4,5],[6,7,8,9],[10,11,17,18,19,20,21],[1,7,16,22],[4,10,14],[1,3,7,9],[26,30,32,43,44],[12,26],[18,30],[16,43],[23,24,26,27,28,29])
groups = list([12,13,14,15,16,23,24],[1,2,3,4,5],[6,7,8,9],[10,11,17,18,19,20,21],[1,7,16,22],[4,10,14],[1,3,7,9]);,[26,30,32,43,44],[12,26],[18,30],[16,43],[23,24,26,27,28,29])

groupnames = ['60, 3 and 5um', '90, 3 um', '90, 5um', '120, 3 um', '30%', '60%','90, 3um, 30%, 50%','30%, smooth','sharp - smooth comparison, 60, 30-40%, 3um','sharp - smooth comparison, 120, 3um, 30%','sharp - smooth comparison, 60, 5um, 30%','smooth, 60, 3um' ]
colors = ['black','red','blue','green','purple','orange','yellow','magenta','cyan']

for i=0,n_elements(groups)-1 do begin
  set = groups[i]
  plots = list()
  gr = read_gdf(folders[set[0]] + '/gr/gr_total')
  plots.add,plot(gr[0,*],gr[1,*],title='Pair Distribution G(r) for pairs across corner, '+ groupnames[i],xtitle='Distance (diameters)', ytitle='G(r) (unitless)',thick=3,name = names[set[0]],dimensions=[1200,900], color = colors[0])
  for j=1,n_elements(set)-1 do begin
    gr = read_gdf(folders[set[j]] + '/gr/gr_total')
    plots.add,plot(gr[0,*],gr[1,*],thick=3,name = names[set[j]],dimensions=[1200,900],overplot=1,color=colors[j])
  endfor
  leg = legend(target = plots[*])
  plots[0].save,groupnames[i]+'.png'
  plots[0].close
endfor

;stop




  cd,maindir











end