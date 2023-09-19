pro irisARLwEchWidthChk, sEvtNum, sLineID, tIrisData, aLineRg, aContRg, pmVelXs, pmEchSp, uEchFitRes
  
  ; Set the image parameter
  aPosition = [0.1, 0.1, 0.9, 0.9]
  
  ; Contour levels
  nLevels = irisARLwARThreshold(sEvtNum, sLineID)
  mo_print, nLevels
                    
  ; Get the image of the spectrum
  mIrisImgData = mo_irisData2Img(tIrisData, aLineRg, aContRg) ; 2D image data
  
  ; Get the size of image
  szIrisImgData = size(mIrisImgData, /dimensions)

  device, decomposed=1
  window, 0, xsize=500, ysize=500, retain=2
  window, 1, xsize=600, ysize=400, retain=2

  while (!mouse.button ne 4) do begin  ;4 is right mouse button
        wset, 0    ; Window 0
        ; Plot the image and contour
        mo_plotImage, mIrisImgData, /bPix, aThreshold=[0, 2.*stddev(mIrisImgData)], position=aPosition
                    
        ; Contour the bright areas              
        mo_contour, mIrisImgData, levels=nLevels, c_colors=mo_GetColour('Yellow'), position=aPosition
       
        ; Choose a point
        cursor, nX, nY, /change, /data  ; Mouse button move
        
        wset, 1   ; Window 1
        if (nX ge 0) && (nX le szIrisImgData[0] - 1) && (nY ge 0) && (nY le szIrisImgData[1] - 1) then begin
            nX = round(nX) 
            nY = round(nY)
            
            if (n_elements(*pmVelXs[nY, nX]) ne 0) then begin
                if (n_elements(*pmEchSp[nY, nX]) ne 0) then $
                    ; Plot the originl line 
                    plot, *pmVelXs[nY, nX], *pmEchSp[nY, nX], /xstyle, /ystyle, position=aPosition
            
                if (n_elements(*uEchFitRes.pmFitYs[nY, nX]) ne 0) then $
                    ; Fitted line
                    plots, *pmVelXs[nY, nX], *uEchFitRes.pmFitYs[nY, nX], color=mo_getColour('Yellow')
            endif $
            else begin
                erase
            endelse
            
            mo_print, '(' + num2str(nX) + ', ' + num2str(nY) + ')   ' + $ 
                      'Width: ' + num2str(uEchFitRes.tFitPars[nY, nX, 1]) + '   ' + $
                      'Area: ' + num2str(uEchFitRes.tFitPars[nY, nX, 2])
        endif
  endwhile

  ; Reset the mouse button
  !mouse.button = 0

end