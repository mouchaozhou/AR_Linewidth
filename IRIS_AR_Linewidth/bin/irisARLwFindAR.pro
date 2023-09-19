;+
; :Description:
;    根据设定好的阈值，取出辐射较强的部分，即AR区域.
;    目标是得到对应的Mask数组
;    
; :Author: mcz
;-

pro irisARLwFindAR

  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  ; Include the header file
  @irisARLw.in
  
  for i = nStNum, nEdNum do begin
      ; If meet bad data, continue next loop
      if (irisARLwIsBadEvent(i, sLineID)) then $
          continue
          
      sEvtNum = num2str(i)
			mo_print, 'Event number: ' + sEvtNum
      
      ; Get the levels for extracting the AR (also used for contour)
      nLevels = irisARLwARThreshold(sEvtNum, sLineID)
      mo_print, 'levels = ', nLevels 

      ; Include all the paths                   
      @include/irisARLwDirs.in
      ; Create the output dirs
      file_mkdir, sFindARCkImgDir, sARMaskSavDir
      
      ; Restore the data
      restore, sPrepedSavDir + '*.sav', /ve

      ; Get the image of the spectrum
      mIrisImgData = mo_irisData2Img(tIrisData, aLineRg, aContRg) ; 2D image data
     
      ; #summary
      ;   Spectrum data(3D): tIrisData [wave, y, x]
      ;   Image data(2D): mIrisImgData [x, y]
      ;   mIrisImgData is mainly used for showing the effects of next few steps, beacause
      ; 3D spectrum data is not convenient to show what we have done.
      ;   But remember that the 3D spectrum data is what we really need to use in the 
      ; next few programs.
      ; #endsum

      ;===========================================================================================
      ;  -- Plot the original data (Haven't been processed)
      ;
      mo_openPS, sFindARCkImgDir + 'raw.eps', ys=nDfPSY 
      mo_plotImage, mIrisImgData, /bPix, aThreshold=[0, 2.*stddev(mIrisImgData)], position=aDfImgWithBarPos, $
                    /bColorBar, aBarPosition=aDfBarPosition
      mo_closePS
      ;===========================================================================================

      ;===========================================================================================
      ;  -- Remove the non-data
      ;
      ; Remove the bad lines
      irisARLwRmBadLines, sEvtNum, mIrisImgData, irisARLwBadLines(sEvtNum, sLineID), $
                          aBadLinePosEx=irisARLwBadLinesEx(sEvtNum, sLineID), $
                        ; @out
                          tIrisData=tIrisData
                          
      ; Remove the bad columns
      szIrisImgData = size(mIrisImgData, /dimensions)
      aBadColumnPos = irisARLwBadColumns(sEvtNum, sLineID, szIrisImgData[0] - 1)
      if (aBadColumnPos[0] ne -1) then begin
          irisARLwRmBadColumns, sEvtNum, mIrisImgData, aBadColumnPos, $
                              ; @out
                                tIrisData=tIrisData
      endif  

      ; Plot the image of having removed non-data
      mo_openPS, sFindARCkImgDir + 'rm_nondata.eps', ys=nDfPSY 
      mo_plotImage, mIrisImgData, /bPix, aThreshold=[0, 2.*stddev(mIrisImgData)], position=aDfImgWithBarPos, $
                    /bColorBar, aBarPosition=aDfBarPosition
      mo_closePS
      ;===========================================================================================
      
      ;===========================================================================================
      ;  -- Smooth the data
      ;  
      ; So that we can have continuous contour areas
      
      if (i le 85) then begin
          mIrisSmImgData = smooth(mIrisImgData, 2, /edge_truncate)
      endif $
      else begin
          mIrisSmImgData = mIrisImgData
      endelse
      ;===========================================================================================
      
      ;===========================================================================================
      ;  -- Plot the image and contour the bright areas
      ;
      ; Open the device PS
      mo_openPS, sFindARCkImgDir + 'smooth.eps', ys=nDfPSY 
      ; The smoothed image with contours 
      mo_plotImage, mIrisSmImgData, /bPix, aThreshold=[0, 2.*stddev(mIrisSmImgData)], position=aDfImgWithBarPos, $
                    /bColorBar, aBarPosition=aDfBarPosition
      ; Contour the bright areas              
      mo_contour, mIrisSmImgData, levels=nLevels, c_colors=mo_loadColour('Yellow'), position=aDfImgWithBarPos
      loadct, 0
      ; Close the ps
      mo_closePS
      ;===========================================================================================
      
      ;===========================================================================================
      ;  -- Create the mask and extract the needed data
      ;
      ; Create the mask array (2D [x, y]) and get the reversed mask (mask that is to select the non-AR data)
      if (i le !nAREvtNum) then begin  ; AR
          aIndex = where(mIrisSmImgData ge nLevels)
          aRevIndex = where(mIrisSmImgData gt 0 and mIrisSmImgData lt nLevels)
      endif $
      else begin ; QS
          aIndex = where(mIrisSmImgData gt nLevels)  ; nLevels = 0 fixed
          ; QS doesn't need reverse mask
      endelse
      
      ; Get the mask （取出AR） and reverse mask （取出背景）
      irisARLwCreateMask, szIrisImgData, aIndex, aRevIndex=aRevIndex, $
                        ; @out
                          mMask=mMask, mRevMask=mRevMask
      ;===========================================================================================                    
                          
      ; Get the extracted data (which is for checking the masked results)
      mIrisImgARData = mIrisImgData * mMask

      ; Check the data by plotting image
      mo_openPS, sFindARCkImgDir + 'AR.eps', ys=nDfPSY 
      mo_plotImage, mIrisImgARData, /bPix, aThreshold=[0, 2.*stddev(mIrisImgData)], position=aDfImgWithBarPos, $
                    /bColorBar, aBarPosition=aDfBarPosition
      mo_closePS
      
      ; Get the rest data (which is for checking the reverse masked results)
      if (i le !nAREvtNum) then begin
          mIrisImgBGData = mIrisImgData * mRevMask
          mo_openPS, sFindARCkImgDir + 'BG.eps', ys=nDfPSY 
          mo_plotImage, mIrisImgBGData, /bPix, aThreshold=[0, 2.*stddev(mIrisImgData)], position=aDfImgWithBarPos, $
                        /bColorBar, aBarPosition=aDfBarPosition
          mo_closePS
      endif
      
      ; Plot the mask
      mo_openPS, sFindARCkImgDir + 'mask.eps', ys=nDfPSY 
      mo_plotImage, mMask, /bPix, aThreshold=[0, 1], position=aDfImgWithBarPos
      mo_closePS
      
      ; Plot the reverse mask
      if (i le !nAREvtNum) then begin
          mo_openPS, sFindARCkImgDir + 'rev_mask.eps', ys=nDfPSY 
          mo_plotImage, mRevMask, /bPix, aThreshold=[0, 1], position=aDfImgWithBarPos
          mo_closePS
      endif

      
      ; #summary
      ;   mMask: 2D [x, y]
      ;   mRevMask: reversed mask that is to select the non-AR data
      ; #endsum
      ; Save the data
      if (i le !nAREvtNum) then begin   ; AR
          save, mMask, mRevMask, filename=sARMaskSavDir + 'mask.sav'
      endif $
      else begin  ; QS
          save, mMask, filename=sARMaskSavDir + 'mask.sav'
      endelse
      ;===========================================================================================

      obj_destroy, oIrisObj
  endfor

  mo_done
  
end
