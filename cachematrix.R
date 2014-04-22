## Put comments here that give an overall description of what your
## functions do

## This pair of functions allows one to set the value of a matrix and find its inverse.
## The functions also allowing for caching of the value of the inverse, thereby saving time
## for repeated calculations on the same matrix when dealing with large matrices.

## Write a short comment describing this function

## This function allows one to set the value of the matrix and returns a list of functions
## that enable setting and retrieving the value of the matrix as well as setting and
## retrieving the value of its inverse.

makeCacheMatrix <- function(x = matrix()) {
	s <- NULL
	set <- function(y) {
		x <<- y
		s <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) s <<- solve
	getinverse <- function() s
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function

## This function calculates the inverse of the matrix created with the above function.
## However, it first checks to see if the inverse has already been calculated. If it has
## retrieves the inverse and skips the calculation. Otherwise, it calculates the value of
## the inverse and caches that value for later retrieval.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	s <- x$getinverse()
	if(!is.null(s)) {
		message("getting cached data")
		return(s)
	}
	data <- x$get()
	s <- solve(data, ...)
	x$setinverse(s)
	s
}
