;+
; :Description:
;     Correct some strange huge vaule to make the total line profile normal.
;     Use when too huge values appear.
;
; :Author: mcz
;-

function irisARLwCorrectTotSp, sEvtNum, sLineID, aTotSp

	if (sLineID eq 'SIIV1394') then begin
			case sEvtNum of 
  				'9' : aTotSp[where(aTotSp ge 1e7)] = 0
  				'19' : aTotSp[where(aTotSp ge 1e7)] = 0
  				'20' : aTotSp[where(aTotSp ge 2e6)] = 0
  				'22' : aTotSp[where(aTotSp ge 2e6)] = 0
  				'23' : aTotSp[where(aTotSp ge 2e6)] = 0
  				'24' : aTotSp[where(aTotSp ge 4e6)] = 0
  				'25' : aTotSp[where(aTotSp ge 4e6)] = 0
  				else : mo_print, 'No need for correcting the max value.'
			endcase
	endif $
	else if (sLineID eq 'SIIV1403') then begin
	    ; Nothing needs to do
	endif $
	else begin
			message, 'No such line ID: ' + sLineID
	endelse

	return, aTotSp

end
