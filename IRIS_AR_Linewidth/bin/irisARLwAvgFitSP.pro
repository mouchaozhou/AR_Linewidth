;+
; :Description:
;    对平均谱线进行拟合，获得拟合参数
;    平均谱：先空间方向合并，算出求和谱，然后再算出平均谱
;   
; :Author: mcz
;-

pro irisARLwAvgFitSP

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
      
      irisARLwAvgFit, sAvgSpFitSavDir, tIrisData, oIrisObj, nWaveWin, aLineRg, aContRg, mMask
      
      obj_destroy, oIrisObj
  endfor

  mo_done
  
end