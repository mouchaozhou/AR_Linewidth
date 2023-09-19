pro irisARLwEchFitAll
  
  ; Include the header file
  @irisARLw.in
  @test/include/irisARLwTestDirs3.in
  
  sEchAllFitLogFile = sEchFitLogDir + 'irisARLwFitAllLog.log'
  file_delete, sEchAllFitLogFile, /allow_nonexistent

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
      
      ; Create the mask that contains AR adn BG parts
      szMask = size(mMask, /dimensions)
      mAllMask = fltarr(szMask[0], szMask[1])
      mAllMask[where((mMask eq 1) or (mRevMask eq 1))] = 1
      
      irisARLwEchFit, sEchAllFitSavDir, tIrisData, oIrisObj, nWaveWin, aLineRg, aContRg, mAllMask
      
      obj_destroy, oIrisObj
      
      ; Write the log
      openu, hLun, sEchAllFitLogFile, /get_lun, /append
      printf, hLun, 'Evenet number = ' + sEvtNum
      free_lun, hLun
  endfor

  mo_done

end