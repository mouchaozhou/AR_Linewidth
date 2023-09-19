;+
; :Description:
;    Find the bad data.
;    人工找到白线（横向和竖向）并标记（存储在irisARLwBadLines程序中），
;    在后续程序中进行标记（排除）处理
;
; :Author: mcz
;-

pro irisARLwChkData

  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  ; Include the header file
  @irisARLw.in
  
  for i = nStNum, nEdNum do begin
      ; If meet bad data, continue next loop
      if (irisARLwIsBadEvent(i, sLineID)) then $
          continue
          
      sEvtNum = num2str(i)
    
      ; Include all the paths                   
      @include/irisARLwDirs.in
      restore, sPrepedSavDir + '*.sav',/ve
      
      ; Get the image of the spectrum
      mIrisImgData = mo_irisData2Img(tIrisData, aLineRg, aContRg)
      
      ; Plot the image
      window, 1, xsize=900, ysize=700, retain=2
      
      mo_plotImage, mIrisImgData, /bPix, aThreshold=[0, 2.*stddev(mIrisImgData)], position=aDfImgWithBarPos, $
                    /bColorBar, aBarPosition=aDfBarPosition
      
      ; Find bad lines (y coordinates)
      mo_print, 'Extracting non-data y coordinates of line position...'  
      mo_cursorPoints, /bInfo, /bDraw, /bRound, /data, psym=2, color=mo_loadColour('Blue'), $ 
                     ; @out 
                       aYPts=aYPts                       
      mo_print, 'return, [' + strjoin(strcompress(round(aYPts), /remove_all), ', ', /single) + ']'
      
      ; Find bad column non-data (x coordinates)
      mo_print, 'Extracting column non-data x coordinates...'
      mo_cursorPoints, /bInfo, /bDraw, /bRound, /data, psym=2, color=mo_loadColour('Blue'), $ 
                     ; @out 
                       aXPts=aXPts
      aXPts = strcompress(round(aXPts > 0), /remove_all)
      
      nNXPts = n_elements(aXPts)      
      if (nNXPts eq 2) then begin
          print, 'The two points way:' 
          mo_print, "'" + sEvtNum + "' : delColumns = mo_gradeArray(" + aXPts[0] + ', 1, ' + aXPts[1] + ')'
          print, 'The line way:'
          mo_print, "'" + sEvtNum + "' : delColumns = mo_gradeArray(" + aXPts[0] + ',1,' + strcompress(fix(aXPts[0])+3,/remove_all) + ')'
      endif $
      else if (nNXPts gt 2) then begin ; If more than one line, we need an arry, so the string format may be a little different
          sPt = "'" + sEvtNum + "' : delColumns = ["
          sLn = sPt
          for i = 0, nNXPts-1, 2 do begin
              if (i gt 0) then sComma = ', ' else sComma = ''
              sPt += sComma + 'mo_gradeArray(' + aXPts[i] + ', 1, ' +  aXPts[i+1] + ')'
              ; Some column lines are too thin, so we defaultly take 3 points as their widths
              sLn += sComma + 'mo_gradeArray(' + aXPts[i] + ', 1, ' +  strcompress(fix(aXPts[i]) + 3, /remove_all) + ')'
          endfor
          sPt += ']'
          sLn += ']'
  
          print, 'The two points way:' 
          mo_print, sPt       
          print, 'The line way:'
          mo_print, sLn
      endif
      
      loadct,0
      
      ; Remove the bad lines
      irisARLwRmBadLines, sEvtNum, mIrisImgData, irisARLwBadLines(sEvtNum, sLineID), $
                          aBadLinePosEx=irisARLwBadLinesEx(sEvtNum, sLineID)
      ; Remove the bad columns
      szIrisImgData = size(mIrisImgData, /dimensions)
      aBadColumnPos = irisARLwBadColumns(sEvtNum, sLineID, szIrisImgData[0] - 1)
      if (aBadColumnPos[0] ne -1) then begin
          irisARLwRmBadColumns, sEvtNum, mIrisImgData, aBadColumnPos
      endif  
      
      ; Plot the bad data removed image, for checking              
      window, 2, xsize=900, ysize=700, retain=2
      mo_plotImage, mIrisImgData, /bPix, aThreshold=[0, 2.*stddev(mIrisImgData)], position=aDfImgWithBarPos, $
                    /bColorBar, aBarPosition=aDfBarPosition
      loadct, 0
      
      obj_destroy, oIrisObj
  endfor
  
  mo_done
  
end
