;+
; :Description:
;    对平均谱线进行拟合，获得拟合参数
;    平均谱：算出每个空间位置的谱线，然后进行平均
;
; :Author: mcz
;-

pro irisARLwEchFitSP
  
  ; Include the header file
  @irisARLw.in
  @test/include/irisARLwTestDirs3.in
  
  sEchSpFitLogFile = sEchFitLogDir + 'irisARLwFitSPLog.log'
  file_delete, sEchSpFitLogFile, /allow_nonexistent

  for i = nStNum, nEdNum do begin             
      ; If meet bad data, continue next loop
      if (irisARLwIsBadEvent(i, sLineID)) then $
          continue         
      sEvtNum = num2str(i)
      mo_print, 'Event number: ' + sEvtNum
      
      ; Include all the paths                   
      @include/irisARLwDirs.in
      @test/include/irisARLwTestDirs.in
      
      ; Restore the data
      restore, sPrepedSavDir + '*.sav', /ve
      ; Restore the mask
      restore, sARMaskSavDir + '*.sav', /ve
      
      irisARLwEchFit, sEchSpFitSavDir, tIrisData, oIrisObj, nWaveWin, aLineRg, aContRg, mMask
      
      obj_destroy, oIrisObj
      
      ; Write the log
      openu, hLun, sEchSpFitLogFile, /get_lun, /append
      printf, hLun, 'Evenet number = ' + sEvtNum
      free_lun, hLun
  endfor

  mo_done

end