pro irisARLwEchPkIntyRatio, nStCaseNum, nEdCaseNum, sEchWthSavPartDirName, sEchPkIntyVarImgFile, $
                            sEchFitTauSavDir

  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  nPsym = 2
  aLegPos = [aDfImgPosition[0] + 0.02, aDfImgPosition[3] - 0.05]
  aYrange = [1.5, 2.2]
  
  ; Dir to save fitted tau
  file_mkdir, sEchFitTauSavDir
   
  mo_openPS, sEchPkIntyVarImgFile, ys=nDfPSY
  
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
    
      ; Create the array to store the FWHMs and their error
      nNCase = aEvtNums[1] - aEvtNums[0] + 1
      
      ; Set the default below 0 to seperate the bad data
      aMu = fltarr(nNCase) - 2D                 ; The μ value of each AR
      aEchPkIntyRatio = dblarr(nNCase) - 2D       ; The intensity ratio
      
      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, 'SIIV1403')) then $
              continue
          sEvtNum = num2str(j) 
          
          ; #region Restore 1394 peak intensity
          sEch1394WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sEchWthSavPartDirName + '/' + $
              sEvtNum + '/SIIV1394/'
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sEch1394WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nMu'
          oSavObj->restore, 'nEchPkInty'
          nEch1394PkInty = temporary(nEchPkInty)
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion
          
          ; #region Restore 1403 peak intensity
          sEch1403WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sEchWthSavPartDirName + '/' + $
              sEvtNum + '/SIIV1403/'
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sEch1403WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nEchPkInty'
          nEch1403PkInty = temporary(nEchPkInty)
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion 
          
          ; Store the useful variables
          aMu[j - aEvtNums[0]] = nMu
          aEchPkIntyRatio[j - aEvtNums[0]] = nEch1394PkInty / nEch1403PkInty
      endfor
      
      aValidIndex = where(aEchPkIntyRatio ge 0)

      if (aValidIndex[0] ne -1) then begin
          aMu = aMu[aValidIndex]
          aEchPkIntyRatio = aEchPkIntyRatio[aValidIndex]
          
          if (i eq nStCaseNum) then begin
              plot, aMu, aEchPkIntyRatio, /xstyle, /ystyle, psym=nPsym, xrange=aDfXrange, xtitle='!7l!X', $
                  ytitle='Peak intensity ratio', yrange=aYrange, position=aDfImgPosition, $
                  charsize=nDfCharsize, charthick=nDfCharthick
              xyouts, aDfImgPosition[0] - 0.03, aDfImgPosition[1] - 0.08, 'center', /normal, charsize=nDfCharsize, charthick=nDfCharthick
              xyouts, aDfImgPosition[2] - 0.03, aDfImgPosition[1] - 0.08, 'limb', /normal, charsize=nDfCharsize, charthick=nDfCharthick
          endif $
          else begin
              plots, aMu, aEchPkIntyRatio, psym=nPsym
          endelse
          
          ; #region (Get fitting arrays)
          aMuRgId1 = where((aMu ge 0.4) and (aMu le 1.0))
          aMuRgId2 = where((aMu ge 0)   and (aMu lt 0.4))
          
          if (aMuRgId1[0] ne -1) then begin
              mo_push, aMuRg1, aMu[aMuRgId1]
              mo_push, aEchPkIntyRatioRg1, aEchPkIntyRatio[aMuRgId1]
          endif
  
          if (aMuRgId2[0] ne -1) then begin
              mo_push, aMuRg2, aMu[aMuRgId2]
              mo_push, aEchPkIntyRatioRg2, aEchPkIntyRatio[aMuRgId2]
          endif        
      endif
  endfor

  ; #region Fitting the data (linear fitting)
  aFitPars1 = linfit(aMuRg1, aEchPkIntyRatioRg1, /double)

  aColours = [ mo_loadColour('Red'), mo_loadColour('Blue') ]

  oplot, aMuRg1, aFitPars1[0] + aFitPars1[1] * aMuRg1, color=aColours[0], thick=nDfThick
  ; #endregion
  
  ; #region Fitting the optical depth: tau  (nonlinear fitting)
  aAllMu = [aMuRg1, aMuRg2]
  aEchAllPkIntyRatio = [aEchPkIntyRatioRg1, aEchPkIntyRatioRg2]
  nInitTau = 0.22d
  aErrs = 1d / sqrt(aEchAllPkIntyRatio)
  
  mo_mpFitFun, aAllMu, aEchAllPkIntyRatio, 'irisARLwPkLineRatioFun', nInitTau, aErrs, $
             ; @out
             aFitPars=aFitPars, aParCErrs=aParCErrs, /autoderivative
  nFitTau = aFitPars[0]
               
  ; Create the self-defined Mu array and corresponding ratio
  aTheoryMu = (findgen(98) + 3.) / 100.
  aEchAllPkIntyRatioFit = irisARLwPkLineRatioFun(aTheoryMu, nFitTau)

  oplot, aTheoryMu, aEchAllPkIntyRatioFit, color=aColours[1], thick=nDfThick
  ; #endregion
   
  ; Calculate and plot two boundary lines (3*sigma)
  nFitTauTop = nFitTau - 3 * aParCErrs[0]
  aEchAllPkIntyRatioFitTop = irisARLwPkLineRatioFun(aTheoryMu, nFitTauTop)
  aBouColors = [ mo_loadColour('Pastel_Blue'), mo_loadColour('Green') ]
  oplot, aTheoryMu, aEchAllPkIntyRatioFitTop, color=aBouColors[0], thick=nDfThick, linestyle=2

  nFitTauBottom = nFitTau + 3 * aParCErrs[0]
  aEchAllPkIntyRatioFitBottom = irisARLwPkLineRatioFun(aTheoryMu, nFitTauBottom)
  oplot, aTheoryMu, aEchAllPkIntyRatioFitBottom, color=aBouColors[1], thick=nDfThick, linestyle=2

  ; Plot the seperator (a vertical line at μ = 0.4)
  nNPts = 100.
  oplot, replicate(0.4, nNPts), mo_gradeArray(aYrange[0], (aYrange[1] - aYrange[0]) / nNPts, $
      aYrange[1]), linestyle=2, color=mo_loadColour('Black')
      
  ; Plot the legend
  asItems = [ 'linear fit for !7l!X = 1 to 0.4', $
              'fit for the optical depth !7s!X =  ' + num2str(nFitTau, format='(f10.2)') + $
              ' !M+!X ' + num2str(aParCErrs[0], format='(f6.2)') ]
  legends, asItems, linestyle=intarr(n_elements(asItems)), colors=aColours, pos=aLegPos, /normal, $
           thick=nDfThick, charthick=nDfCharthick, textcolors=aColours

  xyouts, 0.3, 1.93, '!7s!X = ' + num2str(nFitTauTop, format='(f6.2)'), color=aBouColors[0]
  xyouts, 0.3, 1.76, '!7s!X = ' + num2str(nFitTauBottom, format='(f6.2)'), color=aBouColors[1]

  mo_print, 'tau', nFitTau
  mo_print, 'tau error', aParCErrs[0]
  mo_print, 'b', aFitPars1[0]
  mo_print, 'k', aFitPars1[1]

  loadct,0
  mo_closePS

  undefine, aMuRg1
  undefine, aMuRg2
  undefine, aEchPkIntyRatioRg1
  undefine, aEchPkIntyRatioRg2

  ; Save the tau
  nFitTauErr = aParCErrs[0]
  save, nFitTau, nFitTauTop, nFitTauBottom, nFitTauErr, filename=sEchFitTauSavDir + 'fit_tau.sav'

end