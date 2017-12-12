#Data should be given in data frame with column names where the last column is the column with the variable to predict

model.averaging <- function(data){
  regressors<-colnames(data)[1:(dim(data)[2]-1)]
  X<-data[regressors]
  Y<-data[dim(data)[2]]
  prediction<-colnames(Y)
  kAIC<-0
  beta<-matrix(0,ncol = length(regressors)+1, nrow = 2^(length(regressors))-1)
  l<-1
  for(j in 1:length(regressors)){
    for(k in combn(1:4, j, simplify = FALSE))
    {
      model<-lm(Y[,1]~., data=X[regressors[k]])
      beta[l,1]<-model$coefficients[1]
      kAIC[l]<-AIC(model)
      i<-2
      for(reg in regressors){
        beta[l,i]<-model$coefficients[reg]
        i<-i+1
      }
      l<-l+1
    }
  }
  Delta<-kAIC-min(kAIC)
  w<-exp(-Delta/2)
  weights<-w/sum(w)
  beta[is.na(beta)]<-0
  B<-apply(beta,2,function(x) sum(weights*x)/sum(weights))
  return(B)
}
