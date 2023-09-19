function irisARLwIsBadEvent, nEvtNum, sLineID

  if (sLineID eq 'SIIV1394') then begin
      ; Judge if is the bad event number (in which the data can not be read)
      aBadEvtNum = [ 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, $ ; 16
                     130, 205, 267, 272, $
                     323, 324, 332, 334, $ ; 27
				     354, 355, 447, $   ; !!! Newly found, can not restore save file
                     364, 385, $
                     392, 393, 395, 396, 398, 399, 401, $ ; 31
                     410, 412, 414] ; 32  
  endif $
  else if (sLineID eq 'SIIV1403') then begin
      aBadEvtNum = [ $ ; mo_gradeArray(1,1,85), 
                     93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, $ ; 16
                     108, $ ; 17 part
                     130, 267, 272, $
                     mo_gradeArray(143, 1, 153), $ ; 19 part - 20  
                     mo_gradeArray(203, 1, 263), $ ; 23-24
                     323, 324, 332, 334, $ ; 27
					 354, 355, 447, $   ; !!! Newly found, can not restore save file
                     364, 385, $
                     392, 393, 395, 396, 398, 399, 401, $ ; 31
                     410, 412, 414] ; 32
  endif $
  else begin
      message, 'No such line ID: ' + sLineID
  endelse

  return, ((where(nEvtNum eq aBadEvtNum))[0] ge 0)
  
end
