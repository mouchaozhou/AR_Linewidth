;+
; :Description:
;    检查1394和1403的Mask是否一致
;
; :Author: mcz
;-

pro irisARLwSameMask
  
  ; Some default image parameters
  @include/irisARLwDfImgPars.in
  ; Include the header file
  @irisARLw.in

  for i = nStNum, nEdNum do begin   
      ; If meet bad data, continue next loop
      if (irisARLwIsBadEvent(i, 'SIIV1403')) then $
          continue         
      sEvtNum = num2str(i)
      mo_print, 'Event number: ' + sEvtNum

      ; Include all the paths                   
      @include/irisARLwDirs.in
      
      ; Restore 1403
      sARMaskSav1403Dir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/FindAR_ARMask/' + sEvtNum + '/SIIV1403/'
      restore, sARMaskSav1403Dir + '*.sav', /ve
      mMask1403 = temporary(mMask)
      if (i le !nAREvtNum) then $
          mRevMask1403 = temporary(mRevMask) 
  
      ; Restore 1394
      sARMaskSav1394Dir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Save/FindAR_ARMask/' + sEvtNum + '/SIIV1394/'
      restore, sARMaskSav1394Dir + '*.sav', /ve
      mMask1394 = temporary(mMask)
      if (i le !nAREvtNum) then $
          mRevMask1394 = temporary(mRevMask)

      ; Get the same mask
      szMask1394 = size(mMask1394, /dimensions)
      szMask1403 = size(mMask1403, /dimensions) 
  
      if (szMask1394[0] ne szMask1403[0]) || (szMask1394[1] ne szMask1403[1]) then begin
          mo_print, 'szMask1394', szMask1394
          mo_print, 'szMask1403', szMask1403
          message, 'The dimensions of two data are not the same!'
      endif
      
      ; 取出1394和1403中Mask都为1的区域，即将两者的Mask进行统一
      mMask = intarr(szMask1394[0], szMask1394[1])
      mMask[where((mMask1394 eq 1) and (mMask1403 eq 1))] = 1
      mo_print, 'Mask done!'
      
      ; 只对AR的RevMask进行统一
      if (i le !nAREvtNum) then begin   ; AR
          mRevMask = intarr(szMask1394[0], szMask1394[1])
          mRevMask[where(mRevMask1394 eq 1 and mRevMask1403 eq 1)] = 1
          mo_print, 'revMask done!'
      endif
      
      ; New images in the 1394 folder
      sFindARCkImgDir = '/sdata/moucz/AR_Linewidth/IRIS_AR_Linewidth/Image/FindAR_FindARCheck/' + $
          sEvtNum + '/' + irisARLwLineID(1) + '/'
      file_mkdir, sFindARCkImgDir
       
			; Plot the mask 
			mo_openPS, sFindARCkImgDir + 'same_mask.eps', ys=nDfPSY 
      mo_plotImage, mMask, /bPix, aThreshold=[0, 1], position=aDfImgWithBarPos
      mo_closePS
          
      ; Plot the reverse mask
      if (i le !nAREvtNum) then begin   ; AR
          mo_openPS, sFindARCkImgDir + 'rev_same_mask.eps', ys=nDfPSY 
          mo_plotImage, mRevMask, /bPix, aThreshold=[0, 1], position=aDfImgWithBarPos
          mo_closePS
      endif

      if (i le !nAREvtNum) then begin   ; AR
          ; Save 1394
          save, mMask, mRevMask, filename=sARMaskSav1394Dir + 'mask.sav'
          ; Save 1403
          save, mMask, mRevMask, filename=sARMaskSav1403Dir + 'mask.sav'
      endif $
      else begin  ; QS
          ; Save 1394
          save, mMask, filename=sARMaskSav1394Dir + 'mask.sav'
          ; Save 1403
          save, mMask, filename=sARMaskSav1403Dir + 'mask.sav'
      endelse
  endfor

  mo_done
  
end
