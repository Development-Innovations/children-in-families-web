CIF.ClientsReport = do ->
  _init = ->
    _setFooter()

  _setFooter = ->
  	alert 'hi'
  	vars = {}
		x = document.location.search.substring(1).split('&')
		for i of x
		  z = x[i].split('=', 2)
		  vars[z[0]] = decodeURIComponent(z[1])
		x = [
		  'frompage'
		  'topage'
		  'page'
		  'webpage'
		  'section'
		  'subsection'
		  'subsubsection'
		]
		for i of x
		  y = document.getElementsByClassName(x[i])
		  j = 0
		  while j < y.length
		    y[j].textContent = vars[x[i]]
		    ++j