## these functions will cache the inverse of a matrix using two functions:
## makeCacheMatrix and cacheSolve

## the first function will create a special "matrix" object that can cache its 
## inverse

makeCacheMatrix <- function(x = matrix()) {

    s <- NULL
    set <- function(y){
        x <<- y
        s <- NULL
    }
    
    get <- function() x
    setinv <- function(solve) s <<- solve
    getinv <- function() s
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## the second function will compute the inverse of the special "matrix" returned 
## by makeCacheMatrix. if the inverse has already been calculated, then 
## "cacheSolve" will retrieve it from the chache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    s <- x$getinv()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    
    data <- x$get()
    s <- solve(data, ...)
    x$setinv(m)
    s
}

