## JHBSPH-Coursera R Programming
## Assignment 2
## 2015-07-14 v. 1.0
## The following two functions use R scoping rules to
## cache the inverted value of a matrix.
## Warning: this code assumes that the supplied matrix is
## always invertible!

## This function is the constructor for the functions to set/get
## the value of the matrix and set/get the value of the inverted
## matrix
makeCacheMatrix <- function(x = matrix()) {
    
    im <- NULL
    
    ## set the matrix
    set <- function(y) {
        x <<- y
        im <<- NULL
    }
    
    ## get the matrix
    get <- function() x
    
    ## set the inverse
    setSolve <- function(solve) im <<- solve
    
    ## get the inverse
    getSolve <- function() im
    
    ## build the vector with the list of functions
    list(set = set, get = get,
            setSolve = setSolve,
            getSolve = getSolve)
}


## This function actually computes the inverted matrix, unless it
## has already been computed before, in which case it is retrieved
## from the cache.
cacheSolve <- function(x, ...) {
    
    ## First, try to get the inverted matrix from the cache:
    im <- x$getSolve()
    ## if found, no need to compute the inverse again,
    ## the function simply returns the cached value
    if(!is.null(im)) {
        message("getting cached data")
        return(im)
    }
    
    ## there was no cached value, so the computation has
    ## to be performed
    data <- x$get()
    im <- solve(data, ...)
    
    ## set the computed value of the inverted matrix:
    ## next time there will be no need to compute it again
    x$setSolve(im)
    
    ## return inverted matrix
    im
}







