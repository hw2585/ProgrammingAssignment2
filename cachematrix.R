## The following content includes a list of functions that:
## Set and get the value of the matrix; 
## Set and get the inverse of the matrix.

## Create a matrix object to cache its inverse matrix

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y){
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse)  inv<<- inverse
	getinverse <- function() inv
	list(set=set, get=get, setinverse=setinverse, 
	getinverse= getinverse)
}


## The following content gives the computation of the inverse of the matrix; first it judges whether this inverse of the matrix has been calculated: when true, it skips the execution of these functions and gets the result; if false, it will calculate the inverse matrix and set it in the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        if (!is.null(inverse)){
        	message("getting cached data")
        	return(inverse)
        }
        data <- x$get()
        inverse <- solve(data)
        x$setinverse(inverse)
        inverse
}
