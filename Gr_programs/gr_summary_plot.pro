


pro gr_summary_plot,data

angles = [60,90,120]
angleNames = ['60 degrees','90 degrees', '120 degrees']
angleColors = ['red','green','blue']
widths = [3,5]
widthNames = ['3 um','5 um']
widthThick = [1,3]
styles = [0,1]
styleNames = ['sharp', 'smooth']
styleSymbols = ['s','o']

xrange = [-.1,1.1]
yrange = [0,3]

p = plot([0],[0],/nodata,xrange = xrange,yrange = yrange,xtitle="Packing fraction",ytitle = "First Peak Location",title="Position of First g(r) Peak vs Packing Fraction, Angle, Channel Thickness, and Angle Style")
q = list(length=0)
for i = 0,n_elements(angles) -1 do begin
  w = where(data[0,*] eq angles[i])
  if w[0] eq -1 then continue
  for j = 0,n_elements(widths)-1 do begin
    v = where(data[1,w[*]] eq widths[j])
    if v[0] eq -1 then continue
    for k = 0,n_elements(styles)-1 do begin
      u = where(data[3,w[v[*]]] eq styles[k])
      if u[0] eq -1 then continue
      print,n_elements(u)
      q.add,errorplot(data[2,w[v[u]]],data[4,w[v[u]]],abs(data[5:6,w[v[u]]]-data[4,w[v[u]]]),sym_color = angleColors[i],errorbar_color = angleColors[i],overplot=1,linestyle = ' ',sym_thick = widthThick[j],symbol = styleSymbols[k],errorbar_thick = widthThick[j],name = angleNames[i] + ', ' + widthnames[j] + ', ' + stylenames[k])
    endfor
  endfor
endfor
leg = legend(target = q)

stop

















end