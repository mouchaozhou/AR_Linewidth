pro irisARLwAvgChkVelXs

  ; Include the header file
  @irisARLw.in
  @test/include/irisARLwTestDirs3.in
  
  file_mkdir, sAvgChkVelXsImgDir  
  
  ; Create some arrays 
  nN = nEdNum - nStNum + 1
  aExpMinVelX = fltarr(nN) - 9999.
  aExpMaxVelX = fltarr(nN)
  aExpAvgVelX = fltarr(nN) 
  
  ; The man made width
  nSetWth = 23.
  
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
      oSavObj->restore, 'aLineRg'
      
      ; Destroy the save object
      obj_destroy, oSavObj
      ; #endregion

      ; Resolve object methods
      resolve_object, oIrisObj
      
      ; Get the Doppler speed as x data
      aVelXs = mo_wavelen2Velocity(oIrisObj->getlam(nWaveWin))
      aVelXs = aVelXs[aLineRg[0] : aLineRg[1]]

      ; Save some data     
      aExpVelXs = exp(-(aVelXs / (sqrt(2)*nSetWth))^2) 
      aExpMinVelX[i - 1] = min(aExpVelXs)
      aExpMaxVelX[i - 1] = max(aExpVelXs)
      aExpAvgVelX[i - 1] = mean(aExpVelXs)
      
      mo_push, aExpMinVelXs, aExpMinVelX 
      mo_push, aExpMaxVelXs, aExpMaxVelX
      mo_push, aExpAvgVelXs, aExpAvgVelX
      
      ; Save to the final array
      obj_destroy, oIrisObj
  endfor
  
  aValidIds = where(aExpMinVelXs gt -9999.)
  aExpMinVelXs = aExpMinVelXs[aValidIds]
  aExpMaxVelXs = aExpMaxVelXs[aValidIds]
  aExpAvgVelXs = aExpAvgVelXs[aValidIds]
  
  mo_print, 'MIN -> min max mean: ', min(aExpMinVelXs)
  mo_print, 'MAX -> min max mean: ', max(aExpMaxVelXs)
  mo_print, 'AVG -> min max mean: ',  mean(aExpAvgVelXs)
  
  plot, aExpAvgVelXs, /xstyle, /ystyle, psym=5, xrange=[nStNum - 2, n_elements(aExpMinVelXs) + 2], $
      yrange=[-0.05, max([aExpMinVelXs, aExpMaxVelXs, aExpAvgVelXs])*1.1  ]
  oplot, aExpMaxVelXs, psym=2, color=mo_loadColour('Yellow') 
  oplot, aExpMinVelXs, psym=1, color=mo_loadColour('Blue')
  loadct, 0
  
  mo_saveImage, sAvgChkVelXsImgDir + 'avg_check_velocity_x.png'
  
  undefine, aExpMinVelXs
  undefine, aExpMaxVelXs
  undefine, aExpAvgVelXs
  mo_done
  
end