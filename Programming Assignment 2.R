## These functions written in second peer guided assignment of Coursera Data Science: R Programming 
## Week 3 Assignment; ending at March 13, 2017; GitHub user: madhav s k reddy U

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
  INV <- NULL                             ## initialize "INV" as NULL; will hold value of matrix inverse 
  set <- function(y) {                    ## define the set function to assign new 
    x <<- y                             ## value of matrix in parent environment
    INV <<- NULL                        ## if there is a new matrix, reset "INV" to NULL
  }
  get <- function() x                     ## define the get fucntion - returns value of the matrix argument
  
  setinverse <- function(inverse) INV <<- inverse  ## assigns  the value of "INV" in parent environment
  getinverse <- function() INV                     ## gets the value of "INV" where called
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer 
  ## to the functions with $ operator
}


## This function computes the inverse of the special matrix returned by "makeCacheMatrix" above.
## If the inverse has already been calculated and the matrix has not changed,
## then "cacheSolve" will call back the inverse from the cache

cacheSolve <- function(x, ...) {
  ## Returns the matrix that is a inverse of 'x'
  INV <- x$getinverse()
  if(!is.null(INV)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  INV <- solve(data, ...)
  x$setinverse(INV)
  INV
}