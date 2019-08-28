import scipy.io
mat = scipy.io.loadmat('timeseries/w_clean_tracked')
for i in mat:
    print(i)

print(mat["None"][0][3][1])