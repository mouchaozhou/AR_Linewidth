pro irisARLwAvgTheoryInty, nStCaseNum, nEdCaseNum, sAvgWthSavPartDirName, sAvgFitSavPartDirName, sAvgFitTauSavDir, $
                           sAvgTheoryIntyImgFile, sLineID, uImgPars
                           
  
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
    
      ; Create the array to store the FWHMs and their error
      nNCase = aEvtNums[1] - aEvtNums[0] + 1
      
      ; Set the default below 0 to seperate the bad data
      aMu = fltarr(nNCase) - 2D         ; The μ value of each AR
      aAvgNothmWth = fltarr(nNCase) - 2D
      paVelX = ptrarr(nNCase, /allocate_heap)

      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, 'SIIV1403')) then $
              continue
          sEvtNum = num2str(j)
          mo_print, 'EvtNum: ' + sEvtNum
          
          ; Input data paths                   
          sAvgWthSavDir = '/scratch/mou/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgWthSavPartDirName + '/' + $
              sEvtNum + '/' + sLineID + '/'
      
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sAvgWthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nMu'
          oSavObj->restore, 'nAvgNothmWth'
          
          ; Destroy the save object
          obj_destroy, oSavObj
          
          ; Input data paths                   
          sAvgFitSavDir = '/scratch/mou/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgFitSavPartDirName + '/' + $
              sEvtNum + '/' + sLineID + '/'
      
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sAvgFitSavDir  + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'aVelXs'
          
          ; Destroy the save object
          obj_destroy, oSavObj
          
          ; Store the useful variables
          aMu[j - aEvtNums[0]] = nMu
          aAvgNothmWth[j - aEvtNums[0]] = nAvgNothmWth
          *paVelX[j - aEvtNums[0]] = aVelXs
      endfor

      aValidIndex = where(aAvgNothmWth ge 0)
      
      if (aValidIndex[0] ne -1) then begin
          ; Get only useful data
          aMu = aMu[aValidIndex]
          aAvgNothmWth = aAvgNothmWth[aValidIndex]
          paVelX = paVelX[aValidIndex]
                   
          mo_push, aMus, aMu
          mo_push, aAvgNothmWths, aAvgNothmWth
          mo_push, paVelXs, paVelX
      endif
  endfor
  
  ; Restore fitted tau 
  restore, sAvgFitTauSavDir + '*.sav', /ve
  
  aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))
  ; Theorical line
  aTheoryI = irisARLwLineIntensityFun(aTheoryMu, nFitTau)
    
  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  nPsym = 2
  aPosition = [.1, .1, .98, .9]
  
  ; Open PS
  mo_openPS, sAvgTheoryIntyImgFile, ys=nDfPSY
  
  ; Plot the image
  plot, aTheoryMu, aTheoryI, /xstyle, /ystyle, xrange=aDfXrange, xtitle='!7l!X', $
      ytitle='I(!7l!X)/I(1)', yrange=[uImgPars.aYrange[0]*0.95, $
      uImgPars.aYrange[1]*1.05], position=aPosition, title=uImgPars.sTitle, $
      charsize=nDfCharsize, charthick=nDfCharthick, thick=nDfThick
  

  ; #region Integrating method (from real data)
  aTheoryIntgI = dblarr(n_elements(aAvgNothmWths))
  
  ; dx
  nDVelX = (*paVelXs[i])[1] - (*paVelXs[i])[0]
  
  for i = 0, n_elements(aAvgNothmWths) - 1 do begin
      aTheoryIntgI[i] = irisARLwTheoryIntyFun(nFitTau, aMus[i], *paVelXs[i], aAvgNothmWths[i], nDVelX)
  endfor
  
  aTheoryIntgI /= mean(aTheoryIntgI[where(aMus ge 0.8 and aMus le 1.0)])

  aMuSorIds = sort(aMus)
  aMus = aMus[aMuSorIds]
  aTheoryIntgI = aTheoryIntgI[aMuSorIds]
  
  oplot, aMus, aTheoryIntgI, color=mo_loadColour('Red'), thick=nDfThick
  ; #endregion
  
  ; #region Theory integrating method
  aTheoryIntgI = dblarr(n_elements(aTheoryMu))
  ; dx
  nTheoryDVelX = 1.
  aTheoryVelXs = double(mo_gradeArray(-200., nTheoryDVelX, 200.0))
  nTheoryNothmWth = 22D
  
  for i = 0, n_elements(aTheoryMu) - 1 do begin
      aTheoryIntgI[i] = irisARLwTheoryIntyFun(nFitTau, aTheoryMu[i], aTheoryVelXs, nTheoryNothmWth, nTheoryDVelX)
  endfor
  
  aTheoryIntgI /= min(aTheoryIntgI)
  
  oplot, aTheoryMu, aTheoryIntgI, color=mo_loadColour('Blue'), thick=nDfThick, linestyle=2
  
  ; #endregion
  
  ; #region Test exp(-(x/(sqrt(2)*wth))^2) 0 -> 1
  aExp = mo_gradearray(0, 0.1, 1.0)
  
  loadct, 13
  for i = 0, n_elements(aExp) - 1 do begin 
      aTheoryI = 1. - exp(-nFitTau / aTheoryMu * aExp[i])  
      aTheoryI /= min(aTheoryI)
      oplot, aTheoryMu, aTheoryI, color=i * 20 + 10    
  endfor
  ; #endregion
  
  loadct, 0
  mo_closePS
  
  undefine, aMus
  undefine, aAvgNothmWths
  undefine, paVelXs
  
end