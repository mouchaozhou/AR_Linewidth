pro irisARLwShowAR

  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  
  ; Include all the paths                   
  @include/irisARLwDirs3.in
  
  ; Create the output dirs
  file_mkdir, sEventsImgDir
  
  ; #region AIA data
  ; Read AIA 171 data
  aAiaFiles = mo_fileSearch(sAiaDataDir + '*.fits')
  read_sdo, aAiaFiles[0], uAiaIndex, mAiaData, /uncomp_delete
  
  ; Create aia Map
  index2map, uAiaIndex, mAiaData, uAiaMap
  ; #endregion
  
  ; #region IRIS data
  ; Restore iris data
  sEvtNum = '86'
  sLineID = 'SIIV1394'
  sPrepedSavDir = '/scratch/mou/AR_Linewidth/IRIS_AR_Linewidth/Save/DataPrep_PrepedData/' + sEvtNum + '/' + $
      sLineID + '/'
  restore, sPrepedSavDir + '*.sav', /ve
  
  ;Resolve object methods
  resolve_object, oIrisObj
  
  ; Get the image of the spectrum
  mIrisImgData = mo_irisData2Img(tIrisData, aLineRg, aContRg) ; 2D image data
  
  ; Remove the bad lines
  irisARLwRmBadLines, sEvtNum, mIrisImgData, irisARLwBadLines(sEvtNum, sLineID), $
                      aBadLinePosEx=irisARLwBadLinesEx(sEvtNum, sLineID)
                      
  ; Remove the bad columns
  szIrisImgData = size(mIrisImgData, /dimensions)
  aBadColumnPos = irisARLwBadColumns(sEvtNum, sLineID, szIrisImgData[0] - 1)
  if (aBadColumnPos[0] ne -1) then begin
      irisARLwRmBadColumns, sEvtNum, mIrisImgData, aBadColumnPos
  endif  

  ; X, Y range in arcsec
  aXCors = oIrisObj->getxpos(iwin=nWaveWin)
  aYCors = oIrisObj->getypos()
  aXrange = [aXCors[0], mo_last(aXCors)]
  aYrange = [aYCors[0], mo_last(aYCors)]
  
  ; Center coordinates
  nXCen = oIrisObj->getxcen(nWaveWin)
  nYCen = oIrisObj->getycen(nWaveWin)

  ; Get the resolution of x and y
  aDxs = oIrisObj->getdx(iwin=nWaveWin)
  nDx = mean(aDxs[where(aDxs gt 0.)]) 
  nDy = oIrisObj->getresy(nWaveWin)

  ; Iris index
  uIrisIndex = oIrisObj->gethdr(0, /struct)
  
  ; Create iris Map
  index2map, uIrisIndex, mIrisImgData, uIrisMap
  uIrisMap.xc = nXCen
  uIrisMap.yc = nYCen
  uIrisMap.dx = nDx
  uIrisMap.dy = nDy 
  ; #endregion
  
  ; #region Crop aia map
  ; Extra space
  nExtSpace = 200. ; (arcsec)
  ; A little larger for the submap
  sub_map, uAiaMap, uAiaMap, xrange=[aXrange[0] - nExtSpace, aXrange[1] + nExtSpace], $
      yrange=[aYrange[0] - nExtSpace, aYrange[1] + nExtSpace]
  ; #endregion    
  
  ; #region IRIS mask
  sARMaskSavDir = '/scratch/mou/AR_Linewidth/IRIS_AR_Linewidth/Save/FindAR_ARMask/' + sEvtNum + '/' + sLineID + '/'
  oSavObj = obj_new('IDL_Savefile', sARMaskSavDir + '*.sav')
  oSavObj->restore, 'mMask'
  obj_destroy, oSavObj
  ; #endregion
     
  ; Open PS
  mo_openPS, sEventsImgDir + 'AR.eps', ys=!A4.y-22.7
  
  ; Load color
  aia_lct, r, g, b, wave='171', /load
  
  ; Set the positions
  nTopDis = 0.05
  nBottomDis = 0.15
  nImgWidth = (1.0 - nTopDis - nBottomDis) / 3.0
  
  nLX0 = 0.1
  nAY0 = nBottomDis
  nAY1 = 1.0 - nTopDis
  nLX1 = nImgWidth + nLX0
  aPositionL = [nLX0, nAY0, nLX1, nAY1]
  ; Plot aia map
  plot_map, uAiaMap, xstyle=1, ystyle=1, position=aPositionL, dmin=10., dmax=2000., $  ; 1100
      charsize=0.8, charthick=nDfCharthick, /notitle

  ; The thickness of box and two lines
  nLineThick = 4.0
  ; Plot the box showing the iris range
  plot_box, nXCen, nYCen, aXrange[1] - aXrange[0], aYrange[1] - aYrange[0], /data, $
      color=mo_loadColour('Blue'), thick=nLineThick
      
  ; Reset color table    
  loadct, 0       
  
  ; Calculate the real position of the right image 
  nMX0 = nLX1 + 0.1
  nMX1 = nMX0 + (nAY1 - nAY0)/3.0 * (aXrange[1] - aXrange[0])/(aYrange[1] - aYrange[0])
  aPositionM = [nMX0, nAY0, nMX1, nAY1]
  
  ; Plot iris map
  asXTickName = ['-180', ' ', '-140', ' ', '-100', ' ', '-60']
  aia_lct, r, g, b, wave='171', /load
  plot_map, uIrisMap, xstyle=1, ystyle=1, position=aPositionM, dmin=0, dmax=2.*stddev(mIrisImgData), $
      charsize=0.8, /noerase, charthick=nDfCharthick, /notitle, xtickname=asXTickName
  loadct, 0
    
  ; Calculate two lines position coordinates
  nXLen = aXrange[1] - aXrange[0]
  nYLen = aYrange[1] - aYrange[0]
  nX1 = aPositionL[0] + (nXLen + nExtSpace) * (aPositionL[2] - aPositionL[0]) / (nXLen + 2*nExtSpace)
  nY0 = aPositionL[1] + nExtSpace * (aPositionL[3] - aPositionL[1]) / (nYLen + 2*nExtSpace)
  nY1 = aPositionL[1] + (nYLen + nExtSpace) * (aPositionL[3] - aPositionL[1]) / (nYLen + 2*nExtSpace)
  
  ; Plot two lines pointing from left image to right image
  plot, [0, 1], [0, 1], xrange=[0, 1], yrange=[0, 1], position=[nX1, nY1, aPositionM[0], aPositionM[3]], $
      xstyle=5, ystyle=5, /noerase, color=mo_loadColour('Blue'), /normal, thick=nLineThick
  plot, [0, 1], [1, 0], xrange=[0, 1], yrange=[0, 1], position=[nX1, aPositionM[1], aPositionM[0], nY0], $
      xstyle=5, ystyle=5, /noerase, color=mo_loadColour('Blue'), /normal, thick=nLineThick
  loadct, 0
  
  ; Plot the IRIS mask
  nRX0 = nMX1 + 0.03
  nRX1 = nRX0 + (nAY1 - nAY0)/3.0 * (aXrange[1] - aXrange[0])/(aYrange[1] - aYrange[0])
  aPositionR = [nRX0, nAY0, nRX1, nAY1]
 
  mo_plotImage, mMask, /bDataOnly, aThreshold=[0, 1], charsize=0.8, /noerase, charthick=nDfCharthick, $
      position=aPositionR
  plot_map, uIrisMap, xstyle=1, ystyle=1, charsize=0.8, /noerase, charthick=nDfCharthick, /notitle, $
      position=aPositionR, /no_data, ytickname=replicate(' ', 4), ytitle=' ', xtickname=asXTickName
  mo_closePS

  obj_destroy, oIrisObj
  
  mo_done
  
end