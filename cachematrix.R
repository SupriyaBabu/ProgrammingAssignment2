## the first functions create matrix object that can cache its inverse and 
## second function creates and check for the inverse of the matrix if it already exists

## Creates matrix object

makeCacheMatrix <- function(x = matrix()) {
  invmat <- NULL
  set <- function(y) {
    x <<- y
    invmat <<- NULL
  }
  get <- function()matrix(x,sqrt(length(x)))
  setinv <- function(inv) invmat <<- inv
  getinv <- function() invmat
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## checks if inverse is already solved, if not computes the inverse of the matrix created by above function

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(invmat)
  }		
  mat<-x$get()
  inv_mat_cal<-solve(mat)
  x$setinv(inv_mat_cal)
  inv_mat_cal
}
