function irisARLwLineIntensityFun, aTheoryMu, nFitTau

  aTheoryI = 1D - exp(-nFitTau / aTheoryMu)
  aTheoryI /= min(aTheoryI)
  
  return, aTheoryI
  
end