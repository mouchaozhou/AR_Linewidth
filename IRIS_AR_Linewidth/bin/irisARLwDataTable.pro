pro irisARLwDataTable

  ; Include the header file
  @irisARLw.in
  
  nStNum = 1 
  nEdNum = 461
  
  nStCaseNum = 1
  nEdCaseNum = 37
  nARCaseNum = 32
      
  sTableHead1 = '& & Location & & Number & Exposure & & \multicolumn{2}{c}{Spatial Resolution} & Spectral \\'
  sTableHead2 = 'Type & Date and Time & (x, y) & FOV & of & Time & ${\rm \mu}$ & x & y & Resolution \\'
  sTableHead3 = '& & (arcsec) & (arcsec$^2$) & Rasters & (s) & & (arcsec) & (arcsec) & (${\rm \mathring{A}}$) \\'
  sNTabHead = '10'
  sAlign = strjoin(strarr(fix(sNTabHead)) + 'c')
  
  ; Store the table information
  smTable = strarr(fix(sNTabHead) + 2, nEdNum - nStNum + 1)
  
  for i = nStCaseNum, nEdCaseNum do begin
      ; Get the nCaseNum
      sCaseNum = num2str(i)
      aEvtNums = irisARLwCase2Events(sCaseNum)
      
      ; Only processing the AR datasets
;      if (i le nARCaseNum) then $
;          nMidId = (aEvtNums[1] - aEvtNums[0]) / 2 + aEvtNums[0]; + 1
      
      for j = aEvtNums[0], aEvtNums[1] do begin
          ; If meet bad data, continue next loop
          if (irisARLwIsBadEvent(j, 'SIIV1394')) then $
              continue
              
          sEvtNum = num2str(j)
          mo_print, 'Event number: ', sEvtNum  
          
          ; Get the data parameters
          irisARLwDataPars, sEvtNum, sLineID, $
                            ; @out
                            nWaveWin=nWaveWin  
                            
          ; Include all the paths
          @include/irisARLwDirs.in 
          
          ; Restore the need data
          oSavObj = obj_new('IDL_Savefile', sPrepedSavDir + '*.sav')
          oSavObj->restore, 'oIrisObj'
          obj_destroy, oSavObj
          
          ; Resolve object methods
          resolve_object, oIrisObj

          ; Area type & No.
          if (i le nARCaseNum) then begin   ; AR
              if (j ne aEvtNums[0]) then begin
                  smTable[0, j - 1] = '       ' 
              endif $
              else begin 
                  smTable[0, j - 1] = irisARLwARNum(sCaseNum)   
              endelse
                  
              ; Mark for writing a hline
              if (j ne aEvtNums[1]) then begin
                  smTable[11, j - 1] = '' 
              endif $
              else begin
                  smTable[11, j - 1] = 'L'
              endelse       
          endif $
          else begin  ; QS
              smTable[0, j - 1] = irisARLwARNum(sCaseNum)
              smTable[11, j - 1] = ' '
          endelse
          
          ; Observation time
          sObsTime = (oIrisObj->ti2utc())[0]
          ; Replace the middle 'T' with ' '
          smTable[1, j - 1] = str_replace(sObsTime, 'T', ' ')

          ; X center coordinate
          nXCen = oIrisObj->getxcen()
          ; Y center coordinate
          nYCen = oIrisObj->getycen()
          ; Center coordinate
          smTable[2, j - 1] = num2str(round(nXCen)) + ', ' + num2str(round(nYCen))

          ; FOV
          nFOVX = oIrisObj->getfovx(nWaveWin)
          nFOVY = oIrisObj->getfovy(nWaveWin)
          smTable[3, j - 1] = num2str(round(nFOVX)) + '$\times$' + num2str(round(nFOVY))

          ; Exposure time
          smTable[4, j - 1] = num2str(round(oIrisObj->getexp(0, iwin=nWaveWin)))

          ; Number of rasters
          smTable[5, j - 1] = num2str(fix(oIrisObj->getnraster(nWaveWin)))

          ; Mu
          smTable[6, j - 1] = num2str(mo_mu(nXCen, nYCen), format='(f6.2)')

          ; Resolution in x (raster) direction / Step increments
          nDx = oIrisObj->getdx(0, iwin=nWaveWin)
          if (nDx lt 1) then $
            smTable[7, j - 1] = num2str(nDx, format='(f6.2)') $
          else $
            smTable[7, j - 1] = num2str(round(nDx))

          ; Resolution in y (raster) direction
          smTable[8, j - 1] = num2str(oIrisObj->getinfo('CDELT2', nWaveWin), format='(f6.2)')

          ; Spectral resolution
          smTable[9, j - 1] = num2str(oIrisObj->getinfo('CDELT1', nWaveWin), format='(f6.3)')

          obj_destroy, oIrisObj
          
          ; Extra type for extracting different datasets
          if (i le nARCaseNum) then $
              smTable[10, j - 1] = 'AR' $
          else $
              smTable[10, j - 1] = 'QS'
      endfor
  endfor

  ; Delete the lines belonging to the bad events 
  aDelIds = where(smTable[10, *] eq '')
  smTable = mo_removeArray(smTable, aDelIds, /bLine)

  ; Find the AR and QS data index
  ;aIdAR = where(smTable[10, *] eq 'AR')
  aIdQS = where(smTable[10, *] eq 'QS')
  
  ; Extract the AR and QS time 
  ;saTimeArrAR = smTable[1, aIdAR]
  saTimeArrQS = smTable[1, aIdQS]
 
  ; Sort the time 
  ;aSortIdAR = irisARLwSortTimeIndex(saTimeArrAR)
  aSortIdQS = irisARLwSortTimeIndex(saTimeArrQS)

  ; Write the sorted information back to the table
  ;smTable[*, aIdAR] = smTable[*, aSortIdAR]
  smTable[*, aIdQS] = smTable[*, aSortIdQS + aIdQS[0]]
  
  ; Some Corrections
  ; Exposure time
  ;nId = 4
  ;smTable[nId, 24] = '30' 
  ;smTable[nId, 124] = '8' 
  ;smTable[nId, 136] = '8' 
  ;smTable[nId, 138] = '8' 
  ;smTable[nId, 144] = '8'
  ;smTable[nId, 156] = '8'
  ;smTable[nId, 179] = '8'
  ; Resolution in x (raster) direction / Step increments
  ;nId = 7
  ;smTable[nId, 24] = '2' 
  ;smTable[nId, 136] = '0.35'
  ;smTable[nId, 138] = '0.35'
  ;smTable[nId, 144] = '0.35'
  ;smTable[nId, 156] = '0.35'
  ;smTable[nId, 179] = '0.35'

  ; Ready to create the data table tex file
  @include/irisARLwDirs2.in
  file_mkdir, sDataTableTxtDir
  sDataTableTxtFile = sDataTableTxtDir + 'data_table.tex'
  file_delete, sDataTableTxtFile, /allow_nonexistent
 
  ; Write the tex file
  openw, nLun, sDataTableTxtFile, /get_lun
  
  printf, nLun, '\documentclass{article}'
  printf, nLun, '\usepackage{longtable}'
  printf, nLun, '\usepackage{geometry}'
  printf, nLun, ''
  printf, nLun, '\geometry{left=1.0cm}'
  printf, nLun, ''
  printf, nLun, '\begin{document}'
  printf, nLun, '\setlength{\tabcolsep}{2.5mm}{'
  printf, nLun, '\begin{longtable}{' + sAlign + '}'
  printf, nLun, '	\caption{IRIS OBSERVATION}'
  printf, nLun, '	\label{data_tab} \\'
  printf, nLun, '	\hline \hline'
  printf, nLun, '	' + sTableHead1
  printf, nLun, '        \cline{8-9}'
  printf, nLun, '	' + sTableHead2
  printf, nLun, '	' + sTableHead3
  printf, nLun, '	\hline'
  printf, nLun, '	\endfirsthead'
  printf, nLun, '	\multicolumn{' + sNTabHead + '}{c}{{\bfseries \tablename \thetable{} -- continued}} \\'
  printf, nLun, '	\hline \hline'
  printf, nLun, '	' + sTableHead1
  printf, nLun, '        \cline{8-9}'
  printf, nLun, '	' + sTableHead2
  printf, nLun, '	' + sTableHead3
  printf, nLun, '	\hline'
  printf, nLun, '	\endhead'
  printf, nLun, '	\hline'
  printf, nLun, '	\multicolumn{' + sNTabHead + '}{r}{{Continued on next page}}'
  printf, nLun, '	\endfoot'
  printf, nLun, '	\hline \hline'
  printf, nLun, '	\endlastfoot'

  for i = 0, n_elements(smTable[0, *]) - 1 do begin
      printf, nLun, '        ' + $
              smTable[0, i] + ' & ' + smTable[1, i] + ' & ' + smTable[2, i] + ' & ' + $
              smTable[3, i] + ' & ' + smTable[4, i] + ' & ' + smTable[5, i] + ' & ' + $
              smTable[6, i] + ' & ' + smTable[7, i] + ' & ' + smTable[8, i] + ' & ' + $
              smTable[9, i] + ' \\'
              
      if (smTable[11, i] eq 'L') then $
          printf, nLun, '        \hline'
  endfor
 
  printf, nLun, '\end{longtable}}'
  printf, nLun, '\end{document}'

  free_lun, nLun
  
  mo_done
  
end
