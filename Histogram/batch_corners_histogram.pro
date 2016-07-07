


pro batch_corners_histogram

Plotfolder = '/Users/sphere4/git/corners/Histogram/Plots/'


  names = ['90, 3um, 30%, sharp',$
    '90, 3um, 40%, sharp',$
    '90, 3um, 50%, sharp',$
    '90, 3um, 60%, sharp',$
    '90, 3um, 85%, sharp',$
    '90, 5um, 20%, sharp',$
    '90, 5um, 30%, sharp',$
    '90, 5um, 40%, sharp',$
;    '90, 5um, 50%, sharp',$
    '120, 3um, 60%, sharp',$
    '120, 3um, 80%, sharp',$
    '60, 3um, 40%, sharp',$
    '60, 3um, 50%, sharp',$
    '60, 3um, 60%, sharp',$
    '60, 5um, 20%, sharp',$
    '60, 5um, 30%, sharp',$
;    '120, 3um, 20%, sharp',$
    '120, 3um, 30%, sharp',$
    '120, 3um, 40%, sharp',$
    '120, 3um, 50%, sharp',$
    '120, 3um, 60%, sharp',$
    '120, 5um, 20%, sharp',$
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
;    '90, 5um, 48%, smooth',$
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





plotcolors = ['black','red','blue','green','cyan','yellow','magenta','orange','green yellow', 'dark orchid']


toPlots = list([10,11,12,21,22],[13,14],[0,1,2,3,4],[5,6,7],[8,9,15,16,17,18,23],[19,20],[24,25,26,27],[40,41,42,43,44,45],[34,35,36,37,38,39],[28,29],[30,31,32,33],[11])
Plotnames = ['60, 3um, sharp','60, 5um, sharp','90, 3um, sharp','90, 5um, sharp','120, 3um, sharp','120, 5um, sharp','60, 3um, smooth','60, 5um, smooth','90, 5um, smooth','120, 3um, smooth','120, 5um, smooth','60, 3um, sharp, 50%']

for k = 0,n_elements(toPlots) -1 do begin
  toPlot = toPlots[k]
  plotname = plotnames[k]
  
  outhists = list(length=0)
  plotlist = list(length=0)

for j=0,n_elements(toPlot)-1 do begin
    i = toPlot[j]
    cd,folders[i]
    
    s = read_Gdf('sumdata_collection')

  h = corners_histogram(s)
;  stop
  hist = h[0:1,*]
  mins = h[2,*]
  maxs = h[3,*]

  height = maxs - mins
  dens = h[0:2,*]
;  w = where(height eq 0)
;  if w ne -1 then height[w] = 10e-5
;  print,n_elements(w)
  
  dens[1,*] = dens[1,*] / height[*]
  dens[2,*] = sqrt(hist[1,*]) / height[*]

  outhists.add,dens[0:1,*]
;  plot,h[0,*],h[3,*]-h[2,*]
;  plot,h[0,*],h[1,*]
  wait,0.5
  dens[1:2,*] = dens[1:2,*] / mean(dens[1,*],/nan)
;  print,mean(dens[1,*],/nan)
;  plot,dens[0,*],dens[1,*]
;  wait,0.5
;  plot,h[0,*],h[1,*]

;  wait,0.5
; if i eq 0 then begin
;  outh = h[0:2,*]
;  outh[2,*] = dens[1,*]
; endif else begin
;  outh[1,*] += hist[1,*]
;  outh[2,*] += dens[1,*]
; endelse
;  help,h
;plot,h[0,*],h[1,*]
;  write_gdf,h[0:1,*],'position_histogram'
;  write_gdf,dens[0:1,*],'density_histogram'


w = where(abs(dens[0,*]) eq min(abs(dens[0,*])))
if j eq 0 then begin
  plotlist.add, plot(dens[0,w[0]:-1] * 0.169 / 1.57,0.5 *(dens[1,w[0]:-1] + dens[1,w[0]:0:-1]),xtitle = "Distance from corner, diameters", ytitle = "Particle density, arbitrary units",name = names[toplot[j]],color=plotcolors[j],thick = 3,title = Plotname,dimensions=[1200,900])
endif else begin
  plotlist.add, plot(dens[0,w[0]:-1] * 0.169 / 1.57,0.5 * (dens[1,w[0]:-1] + dens[1,w[0]:0:-1]),xtitle = "Distance from corner, diameters", ytitle = "Particle density, arbitrary units",name = names[toplot[j]],overplot=1,color=plotcolors[j], thick = 3)
endelse
  
  
endfor
leg = legend(target=plotlist)

plotlist[0].save, Plotfolder + Plotname + ".png"
plotlist[0].close


endfor
;for k = 0,n_elements(outhists) -1 do begin
;  out = outhists[k]
;  
;  
;endfor
;w = where(abs(outh[0,*]) eq min(abs(outh[0,*])))

;stop
;p = plot(outh[0,w[0]:-1] * 0.169 / 1.57,outh[1,w[0]:-1] + outh[1,w[0]:0:-1])


;stop
end