pro irisARLwAvgWth, sAvgWthSavDir, sAvgWthImgDir, uAvgFitRes, nXCen, nYCen, oIrisObj, nWaveWin, aVelXs, aAvgSp

  ; Some default image parameters
  @include/irisARLwDfImgPars.in

  ; #region variables
  
  ; Create the output dirs
  file_mkdir, sAvgWthSavDir, sAvgWthImgDir
  
  ; Resolve object methods
  resolve_object, oIrisObj
  
  ; Calculate μ
  nMu = mo_mu(nXCen, nYCen)

  ; Calculate the nonthermal width
  nAvgNothmWth = mo_irisNonthermalWidth(oIrisObj, nWaveWin, mo_width2EWidth(uAvgFitRes.aFitPars[1]))
  nAvgNothmWthErr = uAvgFitRes.aParCErrs[1]
  
  ; Calculate the total Intensity
  nAvgInty = uAvgFitRes.aFitPars[2]
  nAvgIntyErr = uAvgFitRes.aParCErrs[2]
  
  ; Calculate the Peak Intensity
  nAvgPkInty = uAvgFitRes.aFitPars[2] / (sqrt(2 * !DPI) * uAvgFitRes.aFitPars[1])
  nAvgPkIntyErr = nAvgPkInty * (nAvgIntyErr / nAvgInty + nAvgNothmWthErr / nAvgNothmWth)
 
  ; #summary
  ;   Save all the variables
  ;   nMu: the μ value
  ;   nAvgNothmWth: the nonthermal width
  ;   nAvgNothmWthErr: the nonthermal width error
  ;   nAvgPkInty: the peak intensity
  ;   nAvgPkIntyErr: the peak intensity error
  ;   nAvgInty: the total intensity
  ;   nAvgIntyErr: the total intensity error
  ; #endsum
  save, nMu, nAvgNothmWth, nAvgNothmWthErr, nAvgPkInty, nAvgPkIntyErr, nAvgInty, nAvgIntyErr, $
      filename=sAvgWthSavDir + 'results.sav'
  ; #endregion  
    
  ; #region images
  mo_openPS, sAvgWthImgDir + 'avg_width.eps', ys=nDfPSY 
  ; Plot the line profile and fitted profile 
  plot, aVelXs, aAvgSp, /xstyle, /ystyle, position=aDfImgPosition, xtitle='Doppler velocity (km/s)', $
      ytitle='Numbers (count)'
  ; Plot the fitted line profile
  nColor = mo_loadColour('Blue')  
  oplot, aVelXs, uAvgFitRes.aFitYs, color=nColor 
  ; Plot the legend
  legends, ['mean spectrum', 'fitted spectrum nonthermal width:' + num2str(nAvgNothmWth, format='(f6.2)')], $
      linestyle=intarr(2), colors=[0, nColor], charsize=0.9, /normal, charthick=3, thick=3, $
      position=[aDfImgPosition[0]+0.03, aDfImgPosition[2]-0.03]  ; The up left coordinate
  ; Reset the color table
  loadct, 0
  mo_closePS
  ; #endregion
  
end
