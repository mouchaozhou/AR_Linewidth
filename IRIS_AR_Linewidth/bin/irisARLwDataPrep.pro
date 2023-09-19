;+
; :Description:
;    First, find the lineRg and contRg
;    lineRg: 光谱所在的区域
;    contRg: 背景（连续谱）所取的谱线范围
;    Second, read the data and save them, including some key parameters.
;
; :Author: mcz
;-

pro irisARLwDataPrep
  
	; Include the header file
  @irisARLw.in
  
	for i = nStNum, nEdNum do begin
      ; If meet bad data, continue next loop
      if (irisARLwIsBadEvent(i, sLineID)) then $
          continue

      sEvtNum = num2str(i)
      mo_print, 'Event number: ', sEvtNum

      ; Get all the data parameters
      irisARLwDataPars, sEvtNum, sLineID, $
                      ; @out
                      sDataPath=sDataPath, nWaveWin=nWaveWin, aLineRg=aLineRg, aContRg=aContRg
      
      ; Include all the paths                   
      @include/irisARLwDirs.in
      ; Create the output dirs
      file_mkdir, sPrepedSavDir
      
      ; The iris spectrum data position  
      sIrisDataDir = sIrisDataRootDir + sDataPath
      
			; Search for iris data file
      aIrisDataFiles = mo_fileSearch(sIrisDataDir + '*.fits')
      
      ; Read the iris data
      mo_irisReadData, aIrisDataFiles[0], nWaveWin, $
                     ; @out
                       oIrisObj=oIrisObj, tIrisData=tIrisData
     
      ; Find the line range and continuum range
      if (array_equal(aLineRg, [0, 0])) || (array_equal(aContRg, [0, 0])) then begin
          ; Create the output image dirs
          file_mkdir, sLineRgImgDir
          
          ; Show all the lines
          oIrisObj->show_lines 
          
          ; Get the total spectrum
          aTotSp = mo_irisTotalSpectrum(tIrisData)
          
          ; Plot the total spectrum
          window, 0, xsize=1200, ysize=700, retain=2
          device, decomposed=1
          
          ; Correct some strange huge vaule to make the total line profile normal
          aTotSp = irisARLwCorrectTotSp(sEvtNum, sLineID, aTotSp)
          
          ; Plot the total spectrum
          plot, aTotSp, yrange=[irisARLwOptimalY0(sEvtNum, sLineID), max(aTotSp)]
          
          ; Get the spectrum range and continuum range
          mo_cursorPoints, /bInfo, /bDraw, /bRound, /data, psym=2, color=mo_GetColour('Yellow'), $ 
                         ; @out 
                           aXPts=aXPts
         
          if (n_elements(aXPts) lt 4) then $
              message, 'You need at least 4 points'
          
          ; Line rage first, then continuum range    
          print, '=============================================================================='
          print, 'lineRg = [' + num2str(aXPts[0]) + ', ' + num2str(aXPts[1]) + ']'
          print, 'contRg = [' + num2str(aXPts[2]) + ', ' + num2str(aXPts[3]) + ']'
          
          ; If Si IV 1394 and Si IV 1403 in the same wave window, two more points needed
          if (n_elements(aXPts) gt 4) then begin
              print, 'lineRg = [' + num2str(aXPts[4]) + ', ' + num2str(aXPts[5]) + ']'
              print, 'contRg = [' + num2str(aXPts[2]) + ', ' + num2str(aXPts[3]) + ']'
          endif
          print, '=============================================================================='    
          
          ; Save the image
          write_png, sLineRgImgDir + 'line_continuum_ranges.png', tvrd(/true)                             
      endif $
      else begin
          ; Print lind id, to check if we did right
          mo_print, oIrisObj->getline_id(nWaveWin)
          
          ; Save the iris object and spectrum data
          save, oIrisObj, tIrisData, nWaveWin, aLineRg, aContRg, filename=sPrepedSavDir + 'preped.sav'
          ; oIrisObj: the iris object
          ; tIrisData: the iris spectrum data
          ; nWaveWin: the sp data wave window number
          ; aLineRg: the line range
          ; aContRg: the coninuum range
          mo_print, 'Data have been successfully saved!'
          
          ; Destroy the iris object
          obj_destroy, oIrisObj
      endelse

  endfor
  
  mo_done
  
end
