## Put comments here that give an overall description of what your
## functions do
# The two functions are generating the inverse of an Matrix x and saving the result in the cache

## Write a short comment describing this function
# This function generates a vector of four functions to set the matrix, get the matrix, set and get the inverse of the matrix based
# the matrix entered to the function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function
# this function calculates the inverse of the matrix, testing first, if the inverse is already saved in the cache. If so, it takes
# the inverse from the cache. Otherwise it calculates the inverse by using solve()

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}

y=makeCacheMatrix(X)
cacheSolve(y)
