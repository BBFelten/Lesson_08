predictforestcover <- function(band1, band2, band3, band4, band5, band7, vcf, mildness = 1.5) {
  b1 <- removeoutliers(band1, mildness)
  b2 <- removeoutliers(band2, mildness)
  b3 <- removeoutliers(band3, mildness)
  b4 <- removeoutliers(band4, mildness)
  b5 <- removeoutliers(band5, mildness)
  b7 <- removeoutliers(band7, mildness)
  vcf[vcf > 100] <- NA
  
  alldata <- brick(b1, b2, b3, b4, b5, b7, vcf)
  names(alldata) <- c("band1", "band2", "band3", "band4", "band5", "band7", "VCF")
  df <- as.data.frame(getValues(alldata))
  model <- lm(VCF ~ band1 + band2 + band3 + band4 + band5 + band7, data = df)
  predicted <- predict(alldata, model, na.rm=TRUE)
  par(mfrow=c(1,3))
  plot(predicted, main='Predicted forest cover')
  plot(vcf, main='VCF')
  plot(vcf-predicted, main='Difference (VCF minus predicted)')
  
  rmse <- sqrt(mean((predicted@data@values-vcfGewata@data@values)^2, na.rm=TRUE))
  return(rmse)
}


