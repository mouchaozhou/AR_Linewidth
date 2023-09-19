pro irisARLwCreateMask, szIrisImgData, aIndex, aRevIndex=aRevIndex, $
                      ; @out
                        mMask=mMask, mRevMask=mRevMask
                        
  ; The AR mask
  mMask = fltarr(szIrisImgData[0], szIrisImgData[1])
  mMask[aIndex] = 1.
  
  ; Reverse mask (the rest part of AR)
  if (n_elements(aRevIndex) ne 0) then begin
      mRevMask = fltarr(szIrisImgData[0], szIrisImgData[1])
      mRevMask[aRevIndex] = 1.
  endif 

end