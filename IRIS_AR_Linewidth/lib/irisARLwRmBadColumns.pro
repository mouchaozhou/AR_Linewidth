pro irisARLwRmBadColumns, sEvtNum, ref_mIrisImgData, aBadColumnPos, $
                        ; @out
                          tIrisData=tIrisData
  
  ; ref_mIrisImgData: [x, y]
  ref_mIrisImgData[aBadColumnPos, *] = -1.  

  ; tIrisData: [wave, y, x]
  if (n_elements(tIrisData) ne 0) then begin                        
      tIrisData[*, *, aBadColumnPos] = -1.
  endif
  
end 