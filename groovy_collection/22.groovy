Map dept = ['Computing' : ['Computing' : 600, 'Information Systems' : 300], 
'Engineering': ['Civil' : 200, 'Mechanical' : 100], 
'Management' : ['Management' : 800] ] 

println dept.keySet()

println dept.get('Computing').keySet()
println dept.get('Engineering').get('Civil')
