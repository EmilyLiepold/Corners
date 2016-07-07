



function corners_histogram,data
remove_pct = .02

resolution = 5
xmin = min(data[0,*])
xmax = max(data[0,*])

xmin = -80
xmax = 80
n = resolution * (xmax - xmin)

hist = histogram(data[0,*],locations = xx,nbins = n,min = xmin, max = xmax, reverse_indices = r)
nh = n_elements(xx)
minhist = xx * 0.
maxhist = xx * 0.
for i=0,nh-2 do begin
  if r[i+1] ge n_elements(r) then continue
  if r[r[i]] eq r[r[i+1]] then continue
  slice = data[1,r[r[i]:r[i+1]-1]]
  sortedSlice = slice[sort(slice)]
  npts = n_elements(sortedSlice)
;  npts = n_elements(data[1,r[r[i]:r[i+1]-1]])
  remove = fix(remove_pct * npts)
;  for j = 0,remove -1 do begin
;    w = where(data[1,*] eq min(data[1,r[r[i]:r[i+1]-1]]))
;    v = where(data[1,*] eq max(data[1,r[r[i]:r[i+1]-1]]))
;    data[1,w] = 0
;    data[1,v] = 0
;  endfor
;  minhist[i] = min(data[1,r[r[i]:r[i+1]-1]])
;  maxhist[i] = max(data[1,r[r[i]:r[i+1]-1]])
  minhist[i] = min(sortedSlice[remove:-remove])
  maxhist[i] = max(sortedSlice[remove:-remove])

endfor
mintot = min(data[1,*])
maxtot = max(data[1,*])
;plot,xx,minhist,yrange=[mintot,maxtot]
;oplot,xx,maxhist
;oplot,data[0,*],data[1,*],psym=3



;stop

;plot,xx,hist

out = [ transpose([[xx],[hist]]), transpose([[minhist]]), transpose([[maxhist]]) ]

;wait,2


;help,out

return,out











end