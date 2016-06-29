



pro corners_histogram,data

resolution = 100
xmin = min(data[0,*])
xmax = max(data[0,*])

xmin = -50
xmax = 50
n = resolution * (xmax - xmin)

hist = histogram(data[0,*],locations = xx,nbins = n,min = xmin, max = xmax)

plot,xx,hist























end