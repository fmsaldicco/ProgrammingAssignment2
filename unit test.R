## Unit Tests for cachematrix.R
## 2015 07 16

## create a matrix
#      [,1] [,2]
#[1,]    1    2
#[2,]    3    4
m <- makeCacheMatrix(matrix(c(1, 3, 2, 4), nrow=2, ncol=2))

## compute inverse
#     [,1] [,2]
#[1,] -2.0  1.0
#[2,]  1.5 -0.5

# first time: compute it
cacheSolve(m)
# 2nd time: get from cache
cacheSolve(m)

## create a new matrix
#     [,1] [,2] [,3]
#[1,]    1    2    7
#[2,]    1    4    0
#[3,]    3    6    4
m <- makeCacheMatrix(matrix(c(1, 1, 3, 2, 4, 6, 7, 0, 4), nrow=3, ncol=3))

## compute inverse
#[,1] [,2]        [,3]
#[1,] -0.4705882 -1.0  0.82352941
#[2,]  0.1176471  0.5 -0.20588235
#[3,]  0.1764706  0.0 -0.05882353

# first time: compute it
cacheSolve(m)

# 2nd time: get from cache
cacheSolve(m)

# 3rd time: get from cache
cacheSolve(m)


