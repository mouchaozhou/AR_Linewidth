pro irisARLwAvgIntyVaryQS

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 33
  nEdCaseNum = 37 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgIntyVarImgDir
  sAvgIntyVarImgFile = sAvgIntyVarImgDir + 'Intensity_QS.eps' 

  uImgPars = { $
     sTitle : 'Intensity of average spectrum in QS', $
     aYrange : [0, 4000], $
     aYThresh : [0, 999999D] $
  }

  sAvgWthSavPartDirName = 'AvgWthSP_AverageSpWidth'
  
  ; #region
  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  aPosition = [.11, .1, .98, .9]
  
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      aEvtNums = irisARLwCase2Events(num2str(i))
      
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
          
          ; Three different time ranges
          if ((j ge 419) && (j le 431)) || (j ge 449) then begin  ; 2014.07
              mo_push, aMu1, nMu
              mo_push, aAvgInty1, nAvgInty
          endif $
          else if (j ge 432) && (j le 433) then begin  ; 2015.05, 06
              mo_push, aMu2, nMu
              mo_push, aAvgInty2, nAvgInty
          endif $
          else if (j ge 434) && (j le 448) then begin  ; 2016.02, 03, 04, 05, 06
              mo_push, aMu3, nMu
              mo_push, aAvgInty3, nAvgInty
          endif
      endfor   ; End of events loop
  endfor  ; End of case loop
  
  aValidIndex1  = where((aAvgInty1 ge uImgPars.aYThresh[0]) and (aAvgInty1 le uImgPars.aYThresh[1]))
      
  if (aValidIndex1[0] ne -1) then begin
      aMu1 = aMu1[aValidIndex1]
      aAvgInty1 = aAvgInty1[aValidIndex1]
  endif
    
  aValidIndex2  = where((aAvgInty2 ge uImgPars.aYThresh[0]) and (aAvgInty2 le uImgPars.aYThresh[1]))
  
  if (aValidIndex1[0] ne -1) then begin
      aMu2 = aMu2[aValidIndex2]
      aAvgInty2 = aAvgInty2[aValidIndex2]
  endif
    
  aValidIndex3  = where((aAvgInty3 ge uImgPars.aYThresh[0]) and (aAvgInty3 le uImgPars.aYThresh[1]))
 
  if (aValidIndex3[0] ne -1) then begin
      aMu3 = aMu3[aValidIndex3]
      aAvgInty3 = aAvgInty3[aValidIndex3]
  endif 
      
  ; Plot the 3 different time ranges data
  ; Open PS
  mo_openPS, sAvgIntyVarImgFile, ys=nDfPSY
  ; Plot the normalised image              ; *   
  plot, aMu1, aAvgInty1, /xstyle, /ystyle, psym=2, xrange=aDfXrange, xtitle='!7l!X', ytitle='I(!7l!X)/I(1)', $
        yrange=[uImgPars.aYrange[0]*0.95, uImgPars.aYrange[1]*1.05], position=aPosition, title=uImgPars.sTitle, $
        charsize=nDfCharsize, charthick=nDfCharthick
  oplot, aMu2, aAvgInty2, color=mo_loadColour('Blue'), psym=4  ; ◇
  oplot, aMu3, aAvgInty3, color=mo_loadColour('Red'), psym=5  ; △
  xyouts, aPosition[0] - 0.03, aPosition[1] - 0.08, 'center', /normal, charsize=nDfCharsize,charthick=nDfCharthick
  xyouts, aPosition[2] - 0.03, aPosition[1] - 0.08, 'limb', /normal, charsize=nDfCharsize,charthick=nDfCharthick
  
  ; #region Plot theorical results
  ; Restore fitted tau 
  restore, sAvgQSFitTauSavDir + '*.sav', /ve
  
  aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))

  ; Theorical line
  aTheoryI = 1D - exp(-nFitTau / aTheoryMu)  
  aTheoryI = aTheoryI / min(aTheoryI) *  min([aAvgInty1, aAvgInty2, aAvgInty3])
  oplot, aTheoryMu, aTheoryI, color=mo_loadColour('Blue'), thick=nDfThick
  
  ; Top theorical boundary line
  aTheoryITop = 1D - exp(-nFitTauTop / aTheoryMu) 
  aTheoryITop = aTheoryITop / min(aTheoryITop) *  min([aAvgInty1, aAvgInty2, aAvgInty3])
  oplot, aTheoryMu, aTheoryITop, color=mo_loadColour('Pastel_Blue'), thick=nDfThick, linestyle=2

  ; Bottom theorical boundary line
  aTheoryIBottom = 1D - exp(-nFitTauBottom / aTheoryMu)
  aTheoryIBottom = aTheoryIBottom / min(aTheoryIBottom) *  min([aAvgInty1, aAvgInty2, aAvgInty3])
  oplot, aTheoryMu, aTheoryIBottom, color=mo_loadColour('Green'), thick=nDfThick, linestyle=2

  loadct, 0
  mo_closePS
   
  undefine, aMu1
  undefine, aAvgInty1
  undefine, aMu2
  undefine, aAvgInty2 
  undefine, aMu3
  undefine, aAvgInty3
  
  mo_done
  
end