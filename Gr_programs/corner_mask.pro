




function channel_mask, channel_width, length, corner_angle,corner_width

half_angle = corner_angle / 2.0
half_width = corner_width / 2.0

corner_height = half_width / tan(half_angle * !Pi / 180.)

total_height = corner_height + channel_width

mask = make_array(length,total_height,/boolean)

mask[*,(-1 * channel_width):-1] += 1

corner_mask = make_array(corner_width,corner_height,/boolean) + 1
corner_mask[0,*] = 0

k = n_elements(corner_mask[0,*]) / (n_elements(corner_mask[*,0])/2.0)
for i = 1,(n_elements(corner_mask[*,0]) - 1) do begin
    for j=0,n_elements(corner_mask[0,*]) - 1 do begin
      if j / (i * 1.0) gt k then begin
        corner_mask[i,j] = 0
        corner_mask[-i,j] = 0
      endif 
    endfor
endfor
stop

mask[(length / 2) - half_width,0] += corner_mask
mask = shift(mask,0,channel_width)
stop
end