makeCacheMatrix <- function(x = matrix()) {

        ##mean value is set to NULL in the beginning
        i <- NULL
        
        ##save matrix
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        
        ##load matrix
        get <- function() x
        
        ##save inverse matrix
        setinverse <- function(inverse) i <<- inverse
        
        ##load inverse matrix
        getinverse <- function() i
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
        
        ##start with calling inverse matrix
        i <- x$getinverse()
        
        ##if i has inverse matrix, load and use it
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        ##if i doesn't have inverse matrix, load matrix
        data <- x$get()
        
        ##and calculate inverse matrix
        i <- solve(data, ...)
        
        ##store inverse matrix
        x$setinverse(i)
        
        m
}
