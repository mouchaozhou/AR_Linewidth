;+
; :Description:
;    Gaussian fitting : AR + QS
;
; :Author: mcz
;-

pro irisARLwAvgFitAll

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
      
      ; Create the mask that contains AR adn BG parts
      szMask = size(mMask, /dimensions)
      mAllMask = fltarr(szMask[0], szMask[1])
      mAllMask[where((mMask eq 1) or (mRevMask eq 1))] = 1
      
      irisARLwAvgFit, sAvgAllFitSavDir, tIrisData, oIrisObj, nWaveWin, aLineRg, aContRg, mAllMask
      
      obj_destroy, oIrisObj
  endfor

  mo_done
  
end
