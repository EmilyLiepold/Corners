






function find_gr_peak,data,width

;Determine width per index

density = data[0,1] - data[0,0]
nsteps = width / (density)
count = make_array(n_elements(data[0,*])-nsteps)

for i=0,n_elements(data[0,*]) - nsteps - 1 do begin
  count[i] = total(data[1,i:(i+nsteps)])
endfor

meanval = mean(count)
stddevval = stddev(count)
maxval = max(count)
peak = where(count[*] eq maxval) + (nsteps / 2)
peak_sigma = (maxval - meanval)/stddevval

sigmas = (count - meanval)/stddevval

w = where(sigmas[*] gt peak_sigma - 0.5 )




print,'The mean value in the width was ',meanval,' with a standard deviation ',$
  stddevval,'.'
print,'The peak at ', data[0,peak],' had a value of ',maxval,' with sigma=',$
  peak_sigma,'.'

;stop

return, [peak,w[0],w[-1]]






end