pro irisARLwAvgTheoryTotI2PkI

  ; Include the header file
  @include/irisARLwDfImgPars.in
  @test/include/irisARLwTestDirs3.in
  ; Output dir
  file_mkdir, sAvgCmpTotI2PkIImgDir
  
  aFitTau = mo_gradeArray(0.01, 0.02, 0.3)
  
  mo_openPS, sAvgCmpTotI2PkIImgDir + 'theory_total_intensity_to_peak_intensity.eps', xs=!A4.x-6.3, ys=!A4.y-19.2
  
  for i = 0, n_elements(aFitTau) - 1 do begin
      nFitTau = aFitTau[i]
  
      ; Public variable
      aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))
      
      ; #region Total intensity
      nTheoryDVelX = 1.
      aTheoryVelXs = double(mo_gradeArray(-200., nTheoryDVelX, 200.0)) 
      nTheoryNothmWth = 22D
      aTheoryTotI = dblarr(n_elements(aTheoryMu))
      for j = 0, n_elements(aTheoryMu) - 1 do begin
          aTheoryTotI[j] = irisARLwTheoryIntyFun(nFitTau, aTheoryMu[j], aTheoryVelXs, nTheoryNothmWth, nTheoryDVelX)
      endfor
      
      aTheoryTotI /= min(aTheoryTotI)
      ; #endregion
      
      ; #region Peak intensity
      aTheoryPkI = irisARLwLineIntensityFun(aTheoryMu, nFitTau)
      ; #endregion
      
      ; #region Plot the image
      if (i eq 0) then begin
          plot, aTheoryMu, aTheoryTotI / aTheoryPkI, /xstyle, /ystyle, xrange=[1, 0], yrange=[0.99, 1.14], $
               xtitle='!7l!X', ytitle='I!Dtot!N/I!Dp!N', charsize=nDfCharsize, charthick=nDfCharthick, $
               position=[0.15, 0.15, 0.95, 0.95]
      endif $
      else if (nFitTau eq 0.07) then begin
          oplot, aTheoryMu, aTheoryTotI / aTheoryPkI, color=mo_loadColour('Blue')
          loadct, 0
      endif $
      else if (nFitTau eq 0.21) then begin
          oplot, aTheoryMu, aTheoryTotI / aTheoryPkI, color=mo_loadColour('Red')
          loadct, 0
      endif $  
      else begin
          oplot, aTheoryMu, aTheoryTotI / aTheoryPkI
      endelse
      ; #endregion
  endfor
  
  ; Plot the legend
  asItems = [ 'I!Dtot!N/I!Dp!N = 0.07', $
              'I!Dtot!N/I!Dp!N = 0.21'   ]
  aColours = [mo_loadColour('Blue'), mo_loadColour('Red')]
  mo_legend, asItems, linestyle=intarr(n_elements(asItems)), colors=aColours, /normal, /top, /left, $
             thick=nDfThick, charthick=nDfCharthick, textcolors=aColours, charsize=0.8
  loadct, 0
             
  mo_closePS
  
  mo_done
  
end