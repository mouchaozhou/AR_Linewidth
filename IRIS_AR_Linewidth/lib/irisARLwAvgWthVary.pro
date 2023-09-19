pro irisARLwAvgWthVary, nStCaseNum, nEdCaseNum, sAvgWthSavPartDirName, sAvgFitTauSavDir, $
                        sAvgWthVarImgFile, sLineID, uImgPars, nTheoryWidth0
  
  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  aPosition = [.1, .1, 0.98, 0.9]
  nPsym = 2
  nErrWidth = 0.01
  aYrange = [15, 40]
  
  mo_openPS, sAvgWthVarImgFile, ys=nDfPSY
  
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
    
      ; Create the array to store the FWHMs and their error
      nNCase = aEvtNums[1] - aEvtNums[0] + 1
      
      ; Set the default below 0 to seperate the bad data
      aMu = fltarr(nNCase) - 2D               ; The μ value of each AR
      aAvgNothmWth = dblarr(nNCase) - 2D      ; Calculated from mean spectrum
      aAvgNothmWthErr = dblarr(nNCase) - 2D   ; The errors for average spectrum

      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, sLineID)) then $
              continue
          sEvtNum = num2str(j) 

          ; Input data paths                   
          sAvgWthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgWthSavPartDirName + '/' + $
              sEvtNum + '/' + sLineID + '/'
      
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sAvgWthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nMu'
          oSavObj->restore, 'nAvgNothmWth'
          oSavObj->restore, 'nAvgNothmWthErr'
          
          ; Destroy the save object
          obj_destroy, oSavObj

          ; Store the useful variables
          aMu[j - aEvtNums[0]] = nMu
          aAvgNothmWth[j - aEvtNums[0]] = nAvgNothmWth
          aAvgNothmWthErr[j - aEvtNums[0]] = nAvgNothmWthErr
      endfor

      ;=============================================================================================================
      ; x-axis --> Mu
      ;
      aValidIndex = where(aAvgNothmWth ge 0)

      if (aValidIndex[0] ne -1) then begin
          ; Get only useful data
          aMu = aMu[aValidIndex]
          aAvgNothmWth = aAvgNothmWth[aValidIndex]
          aAvgNothmWthErr = aAvgNothmWthErr[aValidIndex]
          
          ; Plot the width variation image
          if (i eq nStCaseNum) then begin
              plot_error, aMu, aAvgNothmWth, error=aAvgNothmWthErr, /xstyle, /ystyle, psym=nPsym, xrange=aDfXrange, $
                 yrange=aYrange, /symbol, xtitle='!7l!X', ytitle='average nonthermal width (km/s)', position=aPosition, $
                 width=nErrWidth, /data, title=uImgPars.sTitle, charsize=nDfCharsize, charthick=nDfCharthick
              xyouts, aPosition[0] - 0.03, aPosition[1] - 0.08, 'center', /normal, charsize=nDfCharsize, charthick=nDfCharthick
              xyouts, aPosition[2] - 0.03, aPosition[1] - 0.08, 'limb', /normal, charsize=nDfCharsize, charthick=nDfCharthick
          endif $
          else begin
              plot_error, aMu, aAvgNothmWth, error=aAvgNothmWthErr, xstyle=5, ystyle=5, psym=nPsym, xrange=aDfXrange, $
                 yrange=aYrange, /symbol, /noerase, position=aPosition, width=nErrWidth, /data
          endelse

          ; #region (Get fitting arrays)
          aMuRgId1 = where((aMu ge 0.4) and (aMu le 1.0))
          aMuRgId2 = where((aMu ge 0)   and (aMu lt 0.4))
        
          if (aMuRgId1[0] ne -1) then begin
              mo_push, aMuRg1, aMu[aMuRgId1]
              mo_push, aAvgNothmWthRg1, aAvgNothmWth[aMuRgId1]
              mo_push, aAvgNothmWthErrRg1, aAvgNothmWthErr[aMuRgId1]
          endif

          if (aMuRgId2[0] ne -1) then begin
              mo_push, aMuRg2, aMu[aMuRgId2]
              mo_push, aAvgNothmWthRg2, aAvgNothmWth[aMuRgId2]
              mo_push, aAvgNothmWthErrRg2, aAvgNothmWthErr[aMuRgId2]
          endif
          ; #endregion
      endif
  endfor

  ;=============================================================================================================

  ; Fitting (No need for sorting the arrays)
  aFitPars1 = poly_fit(aMuRg1, aAvgNothmWthRg1, 1, measure_errors=aAvgNothmWthErrRg1)
  aFitPars2 = poly_fit(aMuRg2, aAvgNothmWthRg2, 1, measure_errors=aAvgNothmWthErrRg2)

  aColours = [ mo_loadColour('Red'), mo_loadColour('Red') ]

  oplot, aMuRg1, aFitPars1[0] + aFitPars1[1] * aMuRg1, color=aColours[0], thick=nDfThick
  oplot, aMuRg2, aFitPars2[0] + aFitPars2[1] * aMuRg2, color=aColours[1], thick=nDfThick

  asItems = [ 'b: ' + num2str(aFitPars1[0], format='(f10.2)') + ' k: ' + num2str(aFitPars1[1], format='(f10.2)'), $
              'b: ' + num2str(aFitPars2[0], format='(f10.2)') + ' k: ' + num2str(aFitPars2[1], format='(f10.2)')  ] 

  legends, asItems, linestyle=intarr(n_elements(asItems)), colors=aColours, $
      pos=[aPosition[2] - 0.55, aPosition[3] - 0.03],/normal, thick=nDfThick, charthick=nDfCharthick

  ; #region Plot theorical results
  ; Restore fitted tau 
  restore, sAvgFitTauSavDir + '*.sav', /ve
  
  aTheoryX = double(mo_gradeArray(-100, 1, 100))
  aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))

  ; Theorical line
  aTheoryWidth = irisARLwLineWidthFun(aTheoryMu, aTheoryX, nTheoryWidth0, nFitTau)
  oplot, aTheoryMu, aTheoryWidth, color=mo_loadColour('Blue'), thick=nDfThick
  
  ; Top theorical boundary line
  aTheoryWidthTop = irisARLwLineWidthFun(aTheoryMu, aTheoryX, nTheoryWidth0, nFitTauTop)
  oplot, aTheoryMu, aTheoryWidthTop, color=mo_loadColour('Pastel_Blue'), thick=nDfThick, linestyle=2
  
  ; Bottom theorical boundary line
  aTheoryWidthBottom = irisARLwLineWidthFun(aTheoryMu, aTheoryX, nTheoryWidth0, nFitTauBottom)
  oplot, aTheoryMu, aTheoryWidthBottom, color=mo_loadColour('Green'), thick=nDfThick, linestyle=2
  ; #endregion
      
  loadct, 0
  mo_closePS

  undefine, aMuRg1
  undefine, aMuRg2
  undefine, aAvgNothmWthRg1
  undefine, aAvgNothmWthRg2
  undefine, aAvgNothmWthErrRg1
  undefine, aAvgNothmWthErrRg2

end