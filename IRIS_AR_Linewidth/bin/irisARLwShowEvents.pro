pro irisARLwShowEvents

  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  
  ; Include all the paths                   
  @include/irisARLwDirs3.in
  
  ; Create the output dirs
  file_mkdir, sEventsImgDir 

  ; Read AIA 171 data
  aAiaFiles = mo_fileSearch(sAiaDataDir + '*.fits')
  read_sdo, aAiaFiles[0], uAiaIndex, mAiaData, /uncomp_delete
  
  ; Create aia Map
  index2map, uAiaIndex, mAiaData, uAiaMap
  
  ; Open PS
  mo_openPS, sEventsImgDir + 'events.eps', xs=!A4.x-6.3, ys=nDfPSY
  
  aXEmptyLabels = replicate(' ', 5)   ; Empty label names for X axis
  ; Plot the aia Map
  plot_map, uAiaMap, xstyle=1, ystyle=1, position=[0.1, 0.1, 0.9, 0.9], dmin=10., dmax=700., $
            charsize=1.0, charthick=2.0, /notitle, xtickname=aXEmptyLabels, ytickname=aXEmptyLabels, $
            xtitle=' ', ytitle=' '
  
  nStNum = 1
  nEdNum = 461
  sLineID = 'SIIV1394'
  
  for i = nStNum, nEdNum do begin
      if (irisARLwIsBadEvent(i, sLineID)) then $
          continue
      sEvtNum = num2str(i) 
      mo_print, 'Event: ' + sEvtNum
      
      ; Include all the paths                   
      @include/irisARLwDirs.in
      
      ; Create a savefile object.
      oSavObj = obj_new('IDL_Savefile', sPrepedSavDir + '*.sav')
      
      ; Restore the needed variables 
      oSavObj->restore, 'oIrisObj'
      oSavObj->restore, 'nWaveWin'
      
      ; Destroy the save object
      obj_destroy, oSavObj
  
      ; Resolve object methods
      resolve_object, oIrisObj
      
      ; Center coordinates
      nXCen = oIrisObj->getxcen(nWaveWin)
      nYCen = oIrisObj->getycen(nWaveWin)
      
      ; X and Y corrdinates (in arcsec)
      aXCors = oIrisObj->getxpos(iwin=nWaveWin)
      aYCors = oIrisObj->getypos()
            
      nColor = (i le !nAREvtNum) ? mo_loadColour('Blue') : mo_loadColour('Red')
      
      plot_box, nXCen, nYCen, mo_last(aXCors) - aXCors[0] + 1., mo_last(aYCors) - aYCors[0] + 1., $
          /data, color=nColor, thick=nDfThick
      
      loadct, 0
      
      catch, nErrorStatus
      ; This statement begins the error handler:
      if (nErrorStatus ne 0) then begin
          mo_print, 'Error message: ', !ERROR_STATE.msg
          continue
      endif
      ; #try       
      obj_destroy, oIrisObj   ; This will give a damn mistake which comes from the inapporitate programming in the SSW
      ; #endtry   
  endfor

  mo_closePS

  mo_done
  
end