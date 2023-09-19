function irisARLwLineWidthFun, aTheoryMu, aTheoryX, nTheoryWidth0, nFitTau

  aTheoryWidth = dblarr(n_elements(aTheoryMu))

  for i = 0, n_elements(aTheoryMu)-1 do begin 
      aTheoryI = 1D - exp(-nFitTau/aTheoryMu[i] * exp(-(aTheoryX / (sqrt(2)*nTheoryWidth0))^2))
                                                    ; [avg, sigma, area]
      mo_mpFitFun, aTheoryX, aTheoryI, 'mo_gaussFun', [0, nTheoryWidth0, 1], 1./aTheoryI^2, /quiet, $
                 ; @out
                   aFitPars=aFitPars
                   
      aTheoryWidth[i] = aFitPars[1]                                                           
  endfor

  return, aTheoryWidth
  
end