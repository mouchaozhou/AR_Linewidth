pro irisARLwPaperImg, nStCaseNum, nEdCaseNum, sLineID, sAvgPaperImgFile, sAvgWthSavPartDirName, $
                      sEchWthSavPartDirName, sAvgFitTauSavDir, nTheoryWidth0, sTitle, $
                      bAR=bAR
   
  ; #region Image parameters
  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  nPsym = 2
  nErrBarCenPosX = 0.9
  nErrBarPsym = 6
  nThick4Line = 5
  
  ; The size of the background is viewed as [width, height] = [1, 1]
  nTopDis = 0.03      ; The distance from top of 1st image to the background
  nInterval = 0.01    ; The distance between two images
  nBottomDis = 0.05   ; The distance from bottom of 3rd image to the background
  nX0 = 0.1           ; The start x coordinate
  nX1 = 0.98          ; The end x coordinate
  nImgHeight = (1.0 - nTopDis - nBottomDis - 2.0 * nInterval) / 3.0  ; Image height
  aXEmptyLabels = replicate(' ', 6)   ; Empty label names for X axis
  ; #endregion 
  
  mo_openPS, sAvgPaperImgFile
  
  ; #region Peak intensity ratio ======================================================================================
  nStCaseNum4Ratio = keyword_set(bAR) ? 15 : 33
  
  for i = nStCaseNum4Ratio, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
    
      ; Create the array to store the FWHMs and their error
      nNCase = aEvtNums[1] - aEvtNums[0] + 1
      
      ; Set the default below 0 to seperate the bad data
      aMu = fltarr(nNCase) - 2D                  ; The μ value of each AR
      aAvgPkIntyRatio = dblarr(nNCase) -2D       ; The intensity ratio
      aAvgPkIntyRatioErr = dblarr(nNCase) - 2D   ; The intensity ratio error
      
      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, 'SIIV1403')) then $
              continue
          sEvtNum = num2str(j) 
          
          ; #region Restore 1403 peak intensity
          sAvg1403WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgWthSavPartDirName + '/' + $
              sEvtNum + '/SIIV1403/'
          ; Create a save file object.
          oSavObj = obj_new('IDL_Savefile', sAvg1403WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nAvgPkInty'
          nAvg1403PkInty = temporary(nAvgPkInty)
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion 
          
          ; #region Restore 1394 peak intensity
          sAvg1394WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgWthSavPartDirName + '/' + $
              sEvtNum + '/SIIV1394/'
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sAvg1394WthSavDir + '*.sav')
          oSavObj->restore, 'nMu'
          oSavObj->restore, 'nAvgPkInty' 
          nAvg1394PkInty = temporary(nAvgPkInty)
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion
          
          ; #region 1403 peak intensity error
          sEch1403WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sEchWthSavPartDirName + '/' + $
              sEvtNum + '/' + '/SIIV1403/'
          
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sEch1403WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nEchPkIntyErrDivInty'
          nEch1403PkIntyErrDivInty = temporary(nEchPkIntyErrDivInty)
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion
          
          ; #region 1394 peak intensity error
          sEch1394WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sEchWthSavPartDirName + '/' + $
              sEvtNum + '/' + '/SIIV1394/'
          
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sEch1394WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nEchPkIntyErrDivInty'
          nEch1394PkIntyErrDivInty = temporary(nEchPkIntyErrDivInty)
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion
                
          aMu[j - aEvtNums[0]] = nMu
          aAvgPkIntyRatio[j - aEvtNums[0]] = nAvg1394PkInty / nAvg1403PkInty
          aAvgPkIntyRatioErr[j - aEvtNums[0]] = aAvgPkIntyRatio[j - aEvtNums[0]] * ( $
               nEch1403PkIntyErrDivInty + nEch1394PkIntyErrDivInty)
      endfor
      
      ; Eliminate some bad data (marked as -2)
      aValidIndex = where(aAvgPkIntyRatio ge 0)
      
      if (aValidIndex[0] ne -1) then begin
          aMu = aMu[aValidIndex]
          aAvgPkIntyRatio = aAvgPkIntyRatio[aValidIndex]
          aAvgPkIntyRatioErr = aAvgPkIntyRatioErr[aValidIndex]
          
          ; Save all the data in the final array
          mo_push, aMus, aMu
          mo_push, aAvgPkIntyRatios, aAvgPkIntyRatio
          mo_push, aAvgPkIntyRatioErrs, aAvgPkIntyRatioErr
          
          ; Prepare for linear fitting data (0.4 - 1.0 part)
          aMuRgId1 = where((aMu ge 0.4) and (aMu le 1.0))
        
          if (aMuRgId1[0] ne -1) then begin
              mo_push, aMuRg1, aMu[aMuRgId1]
              mo_push, aAvgPkIntyRatioRg1, aAvgPkIntyRatio[aMuRgId1]
          endif
      endif
  endfor    
   
  ; #region Peak intensity ratio image (top)
  aAvgPkIntyRatioPos = [nX0, 1.0 - nTopDis - nImgHeight, nX1, 1.0 - nTopDis]
  aAvgPkIntyRatioLegPos = [aAvgPkIntyRatioPos[0] + 0.025, aAvgPkIntyRatioPos[3] - 0.015]
  aYrange = [1.6, 2.15]
  
  plot, aMus, aAvgPkIntyRatios, /xstyle, /ystyle, psym=nPsym, xrange=aDfXrange, $
      ytitle='Peak intensity ratio', yrange=aYrange, position=aAvgPkIntyRatioPos, $
      charsize=nDfCharsize, charthick=nDfCharthick, xtickname=aXEmptyLabels, title=sTitle
  xyouts, nX1 - 0.075, 1.0 - nTopDis - 0.02, '(a)', /normal, charsize=nDfCharsize
  
	; Print the sole error bar
  mo_print, 'The peak intensity ratio 3 sigma error: ', mean(3 * aAvgPkIntyRatioErrs)
  
  ; Load colors
  aColours = [ mo_loadColour('Red'), mo_loadColour('Blue'), mo_loadColour('Pastel_Blue'), mo_loadColour('Green') ]
    
  ; Linear fitting
  aFitPars1 = linfit(aMuRg1, aAvgPkIntyRatioRg1, sigma=aFitParsErr1, /double)
  oplot, aMuRg1, aFitPars1[0] + aFitPars1[1] * aMuRg1, color=aColours[0], thick=nThick4Line
  
  mo_print, 'Peak intensity ratio'
  mo_print, 'b: ' + num2str(aFitPars1[0], format='(f10.2)') + ' k: ' + num2str(aFitPars1[1], format='(f10.2)')
  mo_print, 'sig-b: ' + num2str(aFitParsErr1[0], format='(f10.2)') + $
           ' sig-k: ' + num2str(aFitParsErr1[1], format='(f10.2)')
  
  ; Restore the fitted tau value    
  restore, sAvgFitTauSavDir + '*.sav', /ve
  
  ; Create the self-defined Mu array and corresponding ratio
  aTheoryMu = (findgen(98) + 3.) / 100.
  aAvgAllPkIntyRatioFit = irisARLwPkLineRatioFun(aTheoryMu, nFitTau)
  oplot, aTheoryMu, aAvgAllPkIntyRatioFit, color=aColours[1], thick=nDfThick
  
  ; Top theorical boundary line
  aAvgAllPkIntyRatioFitTop = irisARLwPkLineRatioFun(aTheoryMu, nFitTauTop)
  oplot, aTheoryMu, aAvgAllPkIntyRatioFitTop, color=aColours[2], thick=nDfThick, linestyle=2
  
  ; Bottom theorical boundary line
  aAvgAllPkIntyRatioFitBottom = irisARLwPkLineRatioFun(aTheoryMu, nFitTauBottom)
  oplot, aTheoryMu, aAvgAllPkIntyRatioFitBottom, color=aColours[3], thick=nDfThick, linestyle=2 
  
  ; Notation for the 3σ τ
  if (keyword_set(bAR)) then begin
      nXPt = 0.3
      nYTopPt = 1.93
      nYBottomPt = 1.76
  endif else begin
      nXPt = 0.37
      nYTopPt = 2.0
      nYBottomPt = 1.76
  endelse
  xyouts, nXPt, nYTopPt, '!7s!X = ' + num2str(nFitTauTop, format='(f6.2)'), color=aColours[2]
  xyouts, nXPt, nYBottomPt, '!7s!X = ' + num2str(nFitTauBottom, format='(f6.2)'), color=aColours[3]

  ; Plot the seperator (a vertical line at μ = 0.4)
  nNPts = 100.
  oplot, replicate(0.4, nNPts), mo_gradeArray(aYrange[0], (aYrange[1] - aYrange[0]) / nNPts, aYrange[1]), $
      linestyle=2, color=mo_loadColour('Black')
  
  ; Plot the legend
  asItems = [ 'linear fit for !7l!X = 1 to 0.4', $
              'fit for the optical depth !7s!X =  ' + num2str(nFitTau, format='(f10.2)') ]; $
              ; + ' !M+!X ' + num2str(nFitTauErr, format='(f6.2)') ]
  legends, asItems, linestyle=intarr(n_elements(asItems)), colors=aColours, pos=aAvgPkIntyRatioLegPos, /normal, $
           thick=nDfThick, charthick=nDfCharthick, textcolors=aColours
  
  loadct, 0
  ; #endregion
  
  undefine, aMus
  undefine, aAvgPkIntyRatios
  undefine, aAvgPkIntyRatioErrs
  undefine, aMuRg1
  undefine, aAvgPkIntyRatioRg1
  ; #endregion ========================================================================================================
  
  ; #region Peak intensity ============================================================================================
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
    
      ; Create the array to store the FWHMs and their error
      nNCase = aEvtNums[1] - aEvtNums[0] + 1
      
      ; Set the default below 0 to seperate the bad data
      aMu = fltarr(nNCase) - 2D                    ; The μ value of each AR
      aAvgPkInty = dblarr(nNCase) - 2D             ; The peak intensity of each AR
      aAvgPkIntyErr = dblarr(nNCase) - 2D          ; The peak intensity error of each AR
      
      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, sLineID)) then $
              continue
          sEvtNum = num2str(j)
         
          ; #region Restore 1394 (AR) intensity      
          sAvg1394WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgWthSavPartDirName + '/' + $
              sEvtNum + '/SIIV1394/'
          
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sAvg1394WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nMu'
          oSavObj->restore, 'nAvgPkInty'
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion
          
          ; #region 1394 peak intensity error
          sEch1394WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sEchWthSavPartDirName + '/' + $
              sEvtNum + '/' + sLineID + '/'
          
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sEch1394WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nEchPkIntyErr'
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion
          
          ; Store the useful variables
          aMu[j - aEvtNums[0]] = nMu         
          aAvgPkInty[j - aEvtNums[0]] = nAvgPkInty
          aAvgPkIntyErr[j - aEvtNums[0]] = nEchPkIntyErr
      endfor
      
      aValidIndex  = where(aAvgPkInty ge 0) 
      
      if (aValidIndex[0] ne -1) then begin
          aMu = aMu[aValidIndex]
          aAvgPkInty = aAvgPkInty[aValidIndex]
          aAvgPkIntyErr = aAvgPkIntyErr[aValidIndex]
          
          ; Intensity normalize
          if (keyword_set(bAR)) then begin
              ; Find the data near solar center for Normalising
              if ((where((aMu ge 0.8) and (aMu le 1.0)))[0] ne -1) then begin
                  aMuRgId = where((aMu ge 0.8) and (aMu le 1.0)) 
              endif $
              else if ((where((aMu ge 0.6) and (aMu lt 0.8)))[0] ne -1) then begin
                  aMuRgId = where((aMu ge 0.6) and (aMu lt 0.8))
              endif $
              else if ((where((aMu ge 0.4) and (aMu lt 0.6)))[0] ne -1) then begin
                  aMuRgId = where((aMu ge 0.4) and (aMu lt 0.6))
              endif $
              else if ((where((aMu ge 0) and (aMu lt 0.4)))[0] ne -1) then begin
                  aMuRgId = where((aMu ge 0) and (aMu lt 0.4))
              endif
        
              ; Normalise the data
              aAvgPkIntyErr /= mean(aAvgPkInty[aMuRgId])
              aAvgPkInty /= mean(aAvgPkInty[aMuRgId])
          endif
          
          ; Save all the data in the final array
          mo_push, aMus, aMu
          mo_push, aAvgPkIntys, aAvgPkInty
          mo_push, aAvgPkIntyErrs, aAvgPkIntyErr
      endif
  endfor 
  
  ; #region Intensity image (middle)
  aAvgPkIntyPos = [nX0, nBottomDis + nImgHeight + nInterval, nX1, nBottomDis + 2 * nImgHeight + nInterval]

  aYrange = [0, 6]
  sYTitle = 'Peak intensity   I(!7l!X)/I(1)' 
  nErrBarCenPosY = 5.0

  if (~keyword_set(bAR)) then begin
      _ = max(aMus, nMaxMuId)
      nAvgMinPkInty = aAvgPkIntys[nMaxMuId]
      aAvgPkIntys = aAvgPkIntys / nAvgMinPkInty
      aAvgPkIntyErrs = aAvgPkIntyErrs / nAvgMinPkInty
      nErrBarCenPosY = 4.5
  endif
  
  plot, aMus, aAvgPkIntys, /xstyle, /ystyle, psym=nPsym, xrange=aDfXrange, ytitle=sYTitle, $
        yrange=[aYrange[0]*0.95, aYrange[1]*1.05], position=aAvgPkIntyPos, charsize=nDfCharsize, $
        charthick=nDfCharthick, /noerase, xtickname=aXEmptyLabels
  xyouts, nX1 - 0.075, nBottomDis + 2 * nImgHeight + nInterval - 0.02, '(b)', /normal, charsize=nDfCharsize
  
  ; Plot the sole error bar
  mo_oplotSoleErrBar, nErrBarCenPosX, nErrBarCenPosY, mean(aAvgPkIntyErrs), nPsym=nErrBarPsym, thick=nDfCharthick
  mo_print, 'The peak intensity 3 sigma error: ', mean(aAvgPkIntyErrs)
  
  ; Plot the seperator (a vertical line at μ = 0.4)
  oplot, replicate(0.4, nNPts), mo_gradeArray(aYrange[0]*0.95, (aYrange[1]*1.05 - aYrange[0]*0.95)/nNPts, $
      aYrange[1]*1.05), linestyle=2, color=mo_loadColour('Black')
  
  ; Theorical Mu
  aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))
   
  ; Restore the fitted tau value
  restore, sAvgFitTauSavDir + '*.sav', /ve
      
   
  aTheoryPkI = irisARLwLineIntensityFun(aTheoryMu, nFitTau)
 
  oplot, aTheoryMu, aTheoryPkI, color=mo_loadColour('Blue'), thick=nDfThick
  
  loadct, 0
  ; #endregion
  
  undefine, aMus
  undefine, aAvgPkIntys
  undefine, aAvgPkIntyErrs
  ; #endregion ========================================================================================================
  
  ; #region Nonthermal width ==========================================================================================
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
    
      ; Create the array to store the FWHMs and their error
      nNCase = aEvtNums[1] - aEvtNums[0] + 1
      
      ; Set the default below 0 to seperate the bad data
      aMu = fltarr(nNCase) - 2D                  ; The μ value of each AR
      aAvgNothmWth = fltarr(nNCase) - 2D         ; The nonthermal width
      aEchNothmWthErr = fltarr(nNCase) - 2D      ; The stddev of the width error of each AR
      aAvgNothmWthErr = fltarr(nNCase) - 2D      ; The stddev of the width error of average AR
      
      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, sLineID)) then $
              continue
          sEvtNum = num2str(j)
         
          ; #region Restore 1394 nonthermal width
          sAvg1394WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgWthSavPartDirName + '/' + $
              sEvtNum + '/SIIV1394/'
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sAvg1394WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nMu'       
          oSavObj->restore, 'nAvgNothmWth'
          oSavObj->restore, 'nAvgNothmWthErr'
               
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion        
                   
          ; #region 1394 nonthermal width error
          sEch1394WthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sEchWthSavPartDirName + '/' + $
              sEvtNum + '/' + sLineID + '/'
          
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sEch1394WthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nEchNothmWthErr'
          
          ; Destroy the save object
          obj_destroy, oSavObj
          ; #endregion
          
          ; Store the useful variables
          aMu[j - aEvtNums[0]] = nMu         
          aAvgNothmWth[j - aEvtNums[0]] = nAvgNothmWth
          aEchNothmWthErr[j - aEvtNums[0]] = nEchNothmWthErr
          aAvgNothmWthErr[j - aEvtNums[0]] = nAvgNothmWthErr
      endfor
      
      aValidIndex = where(aAvgNothmWth ge 0)
      
      if (aValidIndex[0] ne -1) then begin
          aMu = aMu[aValidIndex]
          aAvgNothmWth = aAvgNothmWth[aValidIndex]
          aEchNothmWthErr = aEchNothmWthErr[aValidIndex]
          aAvgNothmWthErr = aAvgNothmWthErr[aValidIndex]
          
          ; Prepare for linear fitting data (0.4 - 1.0 part)
          aMuRgId1 = where((aMu ge 0.4) and (aMu le 1.0))
        
          if (aMuRgId1[0] ne -1) then begin
              mo_push, aMuRg1, aMu[aMuRgId1]
              mo_push, aAvgNothmWthRg1, aAvgNothmWth[aMuRgId1]
              mo_push, aAvgNothmWthErrRg1, aAvgNothmWthErr[aMuRgId1]
          endif
          ; #endregion
          
          ; Save all the data in the final array
          mo_push, aMus, aMu
          mo_push, aAvgNothmWths, aAvgNothmWth
          mo_push, aEchNothmWthErrs, aEchNothmWthErr
      endif
  endfor
  
  ; #region Nonthermal width image (bottome)
  aAvgNothmWthPos = [nX0, nBottomDis, nX1, nBottomDis + nImgHeight]
  aYrange = [18, 38]
  
  plot, aMus, aAvgNothmWths, /xstyle, /ystyle, psym=nPsym, xrange=aDfXrange, xtitle='!7l!X', $
          ytitle='Nonthermal width (km/s)', yrange=aYrange, position=aAvgNothmWthPos, $
          charsize=nDfCharsize, charthick=nDfCharthick, /noerase
  xyouts, nX1 - 0.075, nBottomDis + nImgHeight - 0.02, '(c)', /normal, charsize=nDfCharsize
          
  ; Plot the sole error bar
  if (keyword_set(bAR)) then $
      nErrBarCenPosY = 33 $
  else $
      nErrBarCenPosY = 31
  mo_oplotSoleErrBar, nErrBarCenPosX, nErrBarCenPosY, mean(aEchNothmWthErrs), nPsym=nErrBarPsym, thick=nDfCharthick
  mo_print, 'The nothermal width 3 sigma error: ', mean(aEchNothmWthErrs)
  
  xyouts, aAvgNothmWthPos[0] - 0.03, aAvgNothmWthPos[1] - 0.04, 'center', /normal, charsize=nDfCharsize, $
      charthick=nDfCharthick
  xyouts, aAvgNothmWthPos[2] - 0.03, aAvgNothmWthPos[1] - 0.04, 'limb', /normal, charsize=nDfCharsize, $
      charthick=nDfCharthick
  
  ; Load colors
  aColours = [ mo_loadColour('Red'), mo_loadColour('Blue'), mo_loadColour('Green') ]
  
  ; Linear fitting    
  aFitPars1 = poly_fit(aMuRg1, aAvgNothmWthRg1, 1, measure_errors=aAvgNothmWthErrRg1, sigma=aFitParsErr1)
  
  mo_print, 'Nonthermal width'
  mo_print, 'b: ' + num2str(aFitPars1[0], format='(f10.2)') + ' k: ' + num2str(aFitPars1[1], format='(f10.2)')
  mo_print, 'sig-b: ' + num2str(aFitParsErr1[0], format='(f10.2)') + $
            ' sig-k: ' + num2str(aFitParsErr1[1], format='(f10.2)')
  
  ; k ± nMultiple * sigma lines
  nMultiple = 30
  nCrossX0 = 0.7
  nCrossY0 = aFitPars1[1] * nCrossX0 + aFitPars1[0]
  nB1 = nCrossY0 - (aFitPars1[1] + nMultiple*aFitParsErr1[1]) * nCrossX0
  nB2 = nCrossY0 - (aFitPars1[1] - nMultiple*aFitParsErr1[1]) * nCrossX0
  
  mo_print, num2str(nMultiple) + 'sig-k1: ' + num2str(aFitPars1[1] + nMultiple*aFitParsErr1[1], format='(f10.2)')
  mo_print, num2str(nMultiple) + 'sig-k2: ' + num2str(aFitPars1[1] - nMultiple*aFitParsErr1[1], format='(f10.2)')
  mo_print, 'b1: ', nB1
  mo_print, 'b2: ', nB2
  
  ;oplot, aMuRg1, nB1 + (aFitPars1[1] + nMultiple*aFitParsErr1[1])* aMuRg1, color=aColours[2], thick=nThick4Line
  ;oplot, aMuRg1, nB2 + (aFitPars1[1] - nMultiple*aFitParsErr1[1])* aMuRg1, color=aColours[2], thick=nThick4Line
  oplot, aMuRg1, aFitPars1[0] + aFitPars1[1] * aMuRg1, color=aColours[0], thick=nThick4Line
  
  ; Theorical line
  aTheoryX = double(mo_gradeArray(-100, 1, 100))
  aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))
  
  ; Calculate and plot the theorical line
  aTheoryWidth = irisARLwLineWidthFun(aTheoryMu, aTheoryX, nTheoryWidth0, nFitTau)
  oplot, aTheoryMu, aTheoryWidth, color=aColours[1], thick=nDfThick
  
  ; Plot the seperator (a vertical line at μ = 0.4)
  oplot, replicate(0.4, nNPts), mo_gradeArray(aYrange[0], (aYrange[1] - aYrange[0]) / nNPts, aYrange[1]), $
      linestyle=2, color=mo_loadColour('Black')
  
  ; Plot the legend
  aAvgNothmWthLegPos = [aAvgNothmWthPos[0] + 0.025, aAvgNothmWthPos[3] - 0.015]
  legends, ['linear fit for !7l!X = 1 to 0.4'], linestyle=[0], colors=aColours[0], pos=aAvgNothmWthLegPos, $ 
           /normal, thick=nDfThick, charthick=nDfCharthick, textcolors=aColours[0]
                 
  loadct, 0
  ; #endregion
   
  undefine, aMus
  undefine, aAvgNothmWths
  undefine, aEchNothmWthErrs
  undefine, aMuRg1
  undefine, aAvgNothmWthRg1
  undefine, aAvgNothmWthErrRg1
  ; #endregion ========================================================================================================
    
  mo_closePS
  
end
