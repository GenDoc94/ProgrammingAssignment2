## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        # Initialize the inverse cache
        m <- NULL
        
        # Setter function to update the matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        # Getter function to retrieve the matrix
        get <- function() x
        
        # Setter function to compute and cache the inverse
        setinverse <- function(solve) m <<- solve
        
        # Getter function to retrieve the cached inverse
        getinverse <- function() m
        
        # Return a list of functions
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
        
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if (!is.null(m)) {
                message("Getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
