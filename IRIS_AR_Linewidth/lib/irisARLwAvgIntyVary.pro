pro irisARLwAvgIntyVary, nStCaseNum, nEdCaseNum, sAvgWthSavPartDirName, sAvgFitTauSavDir, $
                         sAvgIntyVarImgFile, sLineID, uImgPars

  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  nPsym = 2
  aPosition = [.1, .1, .98, .9]
  
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
    
      ; Create the array to store the FWHMs and their error
      nNCase = aEvtNums[1] - aEvtNums[0] + 1
      
      ; Set the default below 0 to seperate the bad data
      aMu = fltarr(nNCase) - 2D         ; The μ value of each AR
      aAvgInty = dblarr(nNCase) -2D      ; The total intensity of each AR

      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, 'SIIV1403')) then $
              continue
          sEvtNum = num2str(j) 
          
          ; Input data paths                   
          sAvgWthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sAvgWthSavPartDirName + '/' + $
              sEvtNum + '/' + sLineID + '/'
        
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sAvgWthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nMu'
          oSavObj->restore, 'nAvgInty'

          ; Destroy the save object
          obj_destroy, oSavObj
          
          ;Store the useful variables
          aMu[j - aEvtNums[0]] = nMu
          aAvgInty[j - aEvtNums[0]] = nAvgInty             
      endfor

      aValidIndex  = where((aAvgInty ge uImgPars.aYThresh[0]) and (aAvgInty le uImgPars.aYThresh[1]))

      if (aValidIndex[0] ne -1) then begin
          aMu = aMu[aValidIndex]
          aAvgInty = aAvgInty[aValidIndex]
             
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
          aAvgInty /= mean(aAvgInty[aMuRgId])
          
          ; #test
          ;  aAvgInty /= min(aAvgInty)
          ; #endtest
          
          ; Save the original data
          mo_push, aMus, aMu
          mo_push, aAvgIntys, aAvgInty 
      endif 
  endfor

  ; Open PS
  mo_openPS, sAvgIntyVarImgFile, ys=nDfPSY

  ; Plot the normalised image
  plot, aMus, aAvgIntys, /xstyle, /ystyle, psym=nPsym, xrange=aDfXrange, xtitle='!7l!X', ytitle='I(!7l!X)/I(1)', $
        yrange=[uImgPars.aYrange[0]*0.95, uImgPars.aYrange[1]*1.05], position=aPosition, title=uImgPars.sTitle, $
        charsize=nDfCharsize, charthick=nDfCharthick
  xyouts, aPosition[0] - 0.03, aPosition[1] - 0.08, 'center', /normal, charsize=nDfCharsize, charthick=nDfCharthick
  xyouts, aPosition[2] - 0.03, aPosition[1] - 0.08, 'limb', /normal, charsize=nDfCharsize, charthick=nDfCharthick

  ; #region Plot theorical results
  ; Restore fitted tau 
  restore, sAvgFitTauSavDir + '*.sav', /ve
  
  aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))
  
  ; Theorical line
  aTheoryI = irisARLwLineIntensityFun(aTheoryMu, nFitTau)
  oplot, aTheoryMu, aTheoryI, color=mo_loadColour('Blue'), thick=nDfThick
  
  ; Top theorical boundary line
  aTheoryITop = irisARLwLineIntensityFun(aTheoryMu, nFitTauTop)
  oplot, aTheoryMu, aTheoryITop, color=mo_loadColour('Pastel_Blue'), thick=nDfThick, linestyle=2

  ; Bottom theorical boundary line
  aTheoryIBottom = irisARLwLineIntensityFun(aTheoryMu, nFitTauBottom)
  oplot, aTheoryMu, aTheoryIBottom, color=mo_loadColour('Green'), thick=nDfThick, linestyle=2
  
  loadct, 0
  mo_closePS

  undefine, aMus
  undefine, aAvgIntys

end