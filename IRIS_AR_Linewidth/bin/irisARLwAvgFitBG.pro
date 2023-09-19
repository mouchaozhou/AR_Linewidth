;+
; :Description:
;    Gaussian fitting : BG (background)
;
; :Author: mcz
;-

pro irisARLwAvgFitBG

  ; Include the header file
  @irisARLw.in

  for i = nStNum, nEdNum do begin   
      ; If meet bad data, continue next loop
      if (irisARLwIsBadEvent(i, sLineID)) then $
          continue         
      sEvtNum = num2str(i)
	    mo_print, 'Event number: ' + sEvtNum
      
      ; Include all the paths                   
      @include/irisARLwDirs.in
      
      ; Restore the data
      restore, sPrepedSavDir + '*.sav', /ve
      ; Restore the mask
      restore, sARMaskSavDir + '*.sav', /ve
      
      irisARLwAvgFit, sAvgBgFitSavDir, tIrisData, oIrisObj, nWaveWin, aLineRg, aContRg, mRevMask
      
      obj_destroy, oIrisObj
  endfor
  
  mo_done
  
end
