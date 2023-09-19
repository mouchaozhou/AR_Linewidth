;+
; :Description:
;    Check the fitting results of each point.
;
; :Author: mcz
;-

pro irisARLwEchWidthChkSP
  
  ; Include the header file
  @irisARLw.in
  
  sEvtNum = num2str(nStNum)
  
  ; Include all the paths                   
  @include/irisARLwDirs.in
  @test/include/irisARLwTestDirs.in
      
  ; Restore the data
  restore, sPrepedSavDir + '*.sav', /ve
  ; Restore some other variables
  restore, sEchSpFitSavDir + '*.sav', /ve

  irisARLwEchWidthChk, sEvtNum, sLineID, tIrisData, aLineRg, aContRg, pmVelXs, pmEchSp, uEchFitRes

  mo_done
  
end