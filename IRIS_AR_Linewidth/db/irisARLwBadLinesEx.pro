function irisARLwBadLinesEx, sEvtNum, sLineID

  if (sLineID eq 'SIIV1394') then begin
      return, -1  ; Means nothing need to be done
  endif $
  else if (sLineID eq 'SIIV1403') then begin
      case sEvtNum of
          '419' : aDelLines = mo_gradeArray(11, 1, 25)
          '420' : aDelLines = mo_gradeArray(11, 1, 25)
          '422' : aDelLines = mo_gradeArray(11, 1, 25)
          '426' : aDelLines = mo_gradeArray(11, 1, 25)
          '427' : aDelLines = mo_gradeArray(11, 1, 25)
          '430' : aDelLines = mo_gradeArray(11, 1, 25)
          '432' : aDelLines = mo_gradeArray(11, 1, 25)
          '433' : aDelLines = mo_gradeArray(11, 1, 25)
          '434' : aDelLines = mo_gradeArray(11, 1, 25)
          '438' : aDelLines = mo_gradeArray(11, 1, 25)
          '441' : aDelLines = mo_gradeArray(524, 1, 536)
          '443' : aDelLines = mo_gradeArray(15, 1, 25)
          '444' : aDelLines = mo_gradeArray(11, 1, 23)
          '445' : aDelLines = mo_gradeArray(11, 1, 29)
          '447' : aDelLines = mo_gradeArray(13, 1, 29)
          '449' : aDelLines = mo_gradeArray(13, 1, 29)
          '450' : aDelLines = mo_gradeArray(11, 1, 29)
          '452' : aDelLines = mo_gradeArray(11, 1, 29)
          '456' : aDelLines = mo_gradeArray(15, 1, 29)
          '457' : aDelLines = mo_gradeArray(13, 1, 25)
          '460' : aDelLines = mo_gradeArray(13, 1, 25)
          else : return, -1
      endcase
  endif $
  else begin
      message, 'No such line ID: ' + sLineID
  endelse

  return, aDelLines
  
end 