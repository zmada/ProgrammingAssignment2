## Matrix inversion is usually a costly computation. The following two
## functions are used to create a special object that stores a matrix
## and cache's its inverse

## The first function creates a special "matrix", which is really 
## a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function (y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(solve) inv <<- solve
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## The following function calculates the inverse of the matrix 
## created with the above function. It first check if the inverse
## has already been calculated. If so, it gets the inverse from
## cache. it calculates the inverse of the data and sets the value
## of the inverse in the cache via the setinv function

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
          message("getting cached data")
          return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
