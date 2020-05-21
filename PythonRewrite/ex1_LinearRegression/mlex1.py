import numpy as np

n = 0; m = 0; X = 0; Y = 0; theta = 0; mean = 0; std = 0

# # how to make a file for this program to work:
# # line 1: the number of features N, the number of datasets M
# # line 2..M+1: N + 1 numbers, the first N numbers is for 
# # 	the first N features, then the last number is the answer
# # 	of the datasets.
# #
# # i can't write vietnamese here 'cuz i am worried that python
# # can't interpret this file.
# #
# # well, if you can't choose the suitable alpha (too big), or 
# # run too much iterations, it can go crazy (run until it 
# # approaches Nan / 0, then death)
# #
# # so, have fun =)

# read all the dataset from the file
def readData():
	global n, m, X, theta, Y
	print("which file?")
	file = input()
	f = open(file,"r")
	content = f.read().split()
	wtf = len(content)

	n = int(content[0])
	m = int(content[1])
	theta = np.zeros(n + 1)
	X = np.ones(shape = (m, n + 1))
	Y = np.zeros(m)

	dem = 2
	for i in range(0, m):
		for j in range(1, n + 1):
			X[i][j] = float(content[dem])
			dem += 1
		Y[i] = float(content[dem])
		dem += 1

# feature normalization, so that the sets won't be too large
def featNorm():
	global n, m, X, mean, std
	mean = np.mean(X, 0); std = np.std(X, 0)
	print(mean)
	print(std)
	for i in range(0, m):
		for j in range(1, n + 1):
			X[i][j] -= mean[j]
			X[i][j] /= std[j]
	# i think i love to use octave more. octave can minus 
	# and devide all numbers in a row/column simultaneously 

# calculate our prediction of the datasets
def h(theta, x):
	return np.dot(np.transpose(theta), x)

# cost function
def J(theta):
	global n, m, X
	total = 0
	for i in range(0, m):
		diff = h(theta, X[i]) - Y[i]
		total += diff * diff
	return total / (2 * m)

# of course, gradient descent
def gradDesc(alpha, runs, startTheta):
	global n, m, X, Y, theta
	theta = startTheta
	for iters in range(0, runs):
		save = np.zeros(m)
		amount = np.zeros(n + 1)
		for i in range(0, m):
			save[i] = h(theta, X[i]) - Y[i]
		for j in range(0, n + 1):
			theta[j] -= (alpha / m) * np.dot(np.transpose(save), X[:, j])
		
readData(); featNorm()

print("how much of alpha value do you want?")
alpha = float(input())
print("how many iterations?")
runs = int(input())
gradDesc(alpha, runs, np.zeros(n + 1))

print("we got the theta:")	
print(theta)	
print("estimated error:")
print(np.sqrt(J(theta))) # i'm not sure why i put the sqrt :)

feat = np.ones(n + 1)
print("gimme some feat:")
for j in range(1, n + 1):
	print("feat " + str(j) + ":")
	feat[j] = int(input())
	feat[j] -= mean[j]
	feat[j] /= std[j]
print("projection: " + str(h(theta, feat)))

print("------------------------------")	
print("we got the theta:")	
# this thing i got it from coursera, though i don't understand 
# about how they found this formula: theta = (X'X)^-1*X'y
theta = np.dot(np.linalg.inv(np.dot(np.transpose(X), X)), np.dot(np.transpose(X), Y))
# oh dear, i took a while to realize, the inv function is 
# actually in linalg (which is inside np). vscode still 
# need to improve a lot.
print(theta)	
print("estimated error:")	
print(np.sqrt(J(theta)))
print("projection: " + str(h(theta, feat)))

#EOF
