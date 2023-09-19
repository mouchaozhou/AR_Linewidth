;+
; :Description:
;    The minimum yrange for plotting the total line profile
;    Use when most values are too small.
;
; :Author: mcz
;-

function irisARLwOptimalY0, sEvtNum, sLineID
  
  nEvtNum = fix(sEvtNum)

  if (sLineID eq 'SIIV1394') then begin
      if (nEvtNum ge 1) && (nEvtNum le 85) then begin
          switch nEvtNum of 
            15 : return, -5e6
            55 : 
            69 : return, -1e6
            else : return, -2e6
          endswitch
      endif $
      else if (nEvtNum ge 86) && (nEvtNum le 117) then begin
          return, -2e7
      endif $
      else if (nEvtNum ge 432) && (nEvtNum le 448) then begin
          return, -3e5
      endif $
      else if (nEvtNum ge 449) && (nEvtNum le 461) then begin
          if (nEvtNum eq 454) then return,-5e5
          return, -2e5
      endif $
      else begin
          switch nEvtNum of
            168 : return, -1e7
            169 : return, -1.2e7
            177 : return, -6e6
            187 : return, -1.2e7
            205 : return, -2.3e7
            217 : return, -7e6
            250 : return, -1.5e6
            251 :         
            252 : return, -2e6
            253 : return, -3e6
            254 :         
            259 : return, -2e6
            260 :         
            261 :         
            262 :         
            263 : return, -2.5e6
            266 :         
            267 : return, -2e6
            272 : return, 0
            364 : return, -4.12e7
            385 : 
            395 :
            396 : return, -3.5e6
            else : return, -5e6
          endswitch
      endelse 
  endif $
  else if (sLineID eq 'SIIV1403') then begin
      if (nEvtNum ge 86) && (nEvtNum le 93) then begin
          return, -2e7
      endif $
      else if (nEvtNum ge 129) && (nEvtNum le 142) then begin
          return, -2.5e6
      endif $
      else if (nEvtNum ge 292) && (nEvtNum le 337) then begin
          return, -4e6
      endif $
      else begin
          switch nEvtNum of 
            168 : return, -1e7
            169 : return, -1.2e7
            177 : return, -6e6
            187 : return, -1.2e7
            266 :         
            267 : return, -2e6
            272 : return, 0
            364 : return, -4.12e7
            385 : return, -3.5e6
            395 : return, -4e6
            396 : return, -3.1e6
            398 : return, -4e6
            else : return, -5e6
          endswitch
      endelse
  endif $
  else begin
      message, 'No such sLineID: ' + sLineID
  endelse

end

