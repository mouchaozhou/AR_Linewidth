function irisARLwTheoryIntyFun, nFitTau, nMu, aVelXs, nAvgNothmWth, nDVelX

  nTheoryIntgI = total((1D - exp(-nFitTau/nMu * exp(-(aVelXs / (sqrt(2)*nAvgNothmWth))^2))) * nDVelX)     

  return, nTheoryIntgI
  
end