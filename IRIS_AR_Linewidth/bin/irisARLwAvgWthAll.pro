pro irisARLwAvgWthAll

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
      
      ; Create a savefile object.
      oSavObj = obj_new('IDL_Savefile', sPrepedSavDir + '*.sav')
      
      ; Restore the needed variables 
      oSavObj->restore, 'oIrisObj'
      oSavObj->restore, 'nWaveWin'
      
      ; Destroy the save object
      obj_destroy, oSavObj
      
      ; Restore some other variables
      restore, sAvgAllFitSavDir + '*.sav', /ve
      
      ; Calcuate some useful physical quantities
      irisARLwAvgWth, sAvgAllWthSavDir, sAvgAllWthImgDir, uAvgFitRes, nXCen, nYCen, oIrisObj, nWaveWin, aVelXs, aAvgSp
        
      obj_destroy, oIrisObj
  endfor

  mo_done
  
end
