




pro corners_stack,usetrfile=usetrfile

corners=read_gdf('middles.gdf')

fls=file_search('subset_sumdata*')
flt=file_search('trshort-6_umdata_*')
if fls[0] eq '' then fls = !null
if flt[0] eq '' then flt = !null
if ~keyword_set(usetrfile) then flt=!null

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
    frame_track += nf
    id = sum[0,*] * 0. + file_id
    if file eq 0 then plot,sum[0,*],sum[1,*],psym=3 else oplot,sum[0,*],sum[1,*],psym=3
    newsum = make_array(4,n_elements(sum[0,*]))
    newsum[0:1,*] = sum[0:1,*]
    newsum[2,*] = sum[5,*]
    newsum[3,*] = id[*]
    bigsum = [[bigsum],[newsum]]
    
  endfor

  k = image(hist_2d(bigsum[0,*],bigsum[1,*]))


;  stop

write_gdf,bigsum,'sumdata_collection'

end