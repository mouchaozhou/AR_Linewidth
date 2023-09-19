pro irisARLwEchPkIntyVaryQS

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 33
  nEdCaseNum = 37 
  
  ; Include all the paths                   
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sEchPkIntyVarImgDir
  sEchPkIntyVarImgFile = sEchPkIntyVarImgDir + 'Peak_Intensity_QS.eps' 

  uImgPars = { $
     sTitle : 'Peak intensity of average of individual sepctrums in QS', $
     aYrange : [0, 4000], $
     aYThresh : [0, 999999D] $
  }

  sEchWthSavPartDirName = 'EchWthSP_EachSpWidth'
  
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
          sEchWthSavDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/' + sEchWthSavPartDirName + '/' + $
              sEvtNum + '/' + sLineID + '/'
        
          ; Create a savefile object.
          oSavObj = obj_new('IDL_Savefile', sEchWthSavDir + '*.sav')
          
          ; Restore the needed variables 
          oSavObj->restore, 'nMu'
          oSavObj->restore, 'nEchPkInty'

          ; Destroy the save object
          obj_destroy, oSavObj
          
          ; Three different time ranges
          if ((j ge 419) && (j le 431)) || (j ge 449) then begin  ; 2014.07
              mo_push, aMu1, nMu
              mo_push, aEchPkInty1, nEchPkInty
          endif $
          else if (j ge 432) && (j le 433) then begin  ; 2015.05, 06
              mo_push, aMu2, nMu
              mo_push, aEchPkInty2, nEchPkInty
          endif $
          else if (j ge 434) && (j le 448) then begin  ; 2016.02, 03, 04, 05, 06
              mo_push, aMu3, nMu
              mo_push, aEchPkInty3, nEchPkInty
          endif
      endfor   ; End of events loop
  endfor  ; End of case loop
  
  aValidIndex1  = where((aEchPkInty1 ge uImgPars.aYThresh[0]) and (aEchPkInty1 le uImgPars.aYThresh[1]))
      
  if (aValidIndex1[0] ne -1) then begin
      aMu1 = aMu1[aValidIndex1]
      aEchPkInty1 = aEchPkInty1[aValidIndex1]
  endif
    
  aValidIndex2  = where((aEchPkInty2 ge uImgPars.aYThresh[0]) and (aEchPkInty2 le uImgPars.aYThresh[1]))
  
  if (aValidIndex1[0] ne -1) then begin
      aMu2 = aMu2[aValidIndex2]
      aEchPkInty2 = aEchPkInty2[aValidIndex2]
  endif
    
  aValidIndex3  = where((aEchPkInty3 ge uImgPars.aYThresh[0]) and (aEchPkInty3 le uImgPars.aYThresh[1]))
 
  if (aValidIndex3[0] ne -1) then begin
      aMu3 = aMu3[aValidIndex3]
      aEchPkInty3 = aEchPkInty3[aValidIndex3]
  endif 
      
  ; Plot the 3 different time ranges data
  ; Open PS
  mo_openPS, sEchPkIntyVarImgFile, ys=nDfPSY
  ; Plot the normalised image              ; *   
  plot, aMu1, aEchPkInty1, /xstyle, /ystyle, psym=2, xrange=aDfXrange, xtitle='!7l!X', ytitle='I(!7l!X)/I(1)', $
        yrange=[uImgPars.aYrange[0]*0.95, uImgPars.aYrange[1]*1.05], position=aPosition, title=uImgPars.sTitle, $
        charsize=nDfCharsize, charthick=nDfCharthick
  oplot, aMu2, aEchPkInty2, color=mo_loadColour('Blue'), psym=4  ; ◇
  oplot, aMu3, aEchPkInty3, color=mo_loadColour('Red'), psym=5  ; △
  xyouts, aPosition[0] - 0.03, aPosition[1] - 0.08, 'center', /normal, charsize=nDfCharsize,charthick=nDfCharthick
  xyouts, aPosition[2] - 0.03, aPosition[1] - 0.08, 'limb', /normal, charsize=nDfCharsize,charthick=nDfCharthick
  
  ; #region Plot theorical results
  ; Restore fitted tau 
  restore, sEchQSFitTauSavDir + '*.sav', /ve
  
  aTheoryMu = double(mo_gradeArray(0.01, 0.01, 1.0))

  ; Theorical line
  aTheoryI = 1D - exp(-nFitTau / aTheoryMu)  
  aTheoryI = aTheoryI / min(aTheoryI) *  min([aEchPkInty1, aEchPkInty2, aEchPkInty3])
  oplot, aTheoryMu, aTheoryI, color=mo_loadColour('Blue'), thick=nDfThick
  
  ; Top theorical boundary line
  aTheoryITop = 1D - exp(-nFitTauTop / aTheoryMu) 
  aTheoryITop = aTheoryITop / min(aTheoryITop) *  min([aEchPkInty1, aEchPkInty2, aEchPkInty3])
  oplot, aTheoryMu, aTheoryITop, color=mo_loadColour('Pastel_Blue'), thick=nDfThick, linestyle=2

  ; Bottom theorical boundary line
  aTheoryIBottom = 1D - exp(-nFitTauBottom / aTheoryMu)
  aTheoryIBottom = aTheoryIBottom / min(aTheoryIBottom) *  min([aEchPkInty1, aEchPkInty2, aEchPkInty3])
  oplot, aTheoryMu, aTheoryIBottom, color=mo_loadColour('Green'), thick=nDfThick, linestyle=2

  loadct, 0
  mo_closePS
   
  undefine, aMu1
  undefine, aEchPkInty1
  undefine, aMu2
  undefine, aEchPkInty2 
  undefine, aMu3
  undefine, aEchPkInty3
  
  mo_done
  
end