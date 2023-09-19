;+
; :Description:
;    Delete the non-data lines.
;
; :Params:
;    sEvtNum
;    ref_mIrisImgData: the iris image data (for checking) (also a return value)
;    aBadLinePos: black lines rough y positions 
;    aBadLinePosEx: some extra bad lines    
;
; :Return:
;    tIrisData: the corrected iris spectrum data
;     
; :Author: mcz
;-

pro irisARLwRmBadLines, sEvtNum, ref_mIrisImgData, aBadLinePos, aBadLinePosEx=aBadLinePosEx, $
                      ; @out
                      tIrisData=tIrisData

  ; The width of strong positive and negative lines
  nStgLineWth = 4
  ; the finding range of two black lines, the serching width will be (2 * nBckLineFdRg + 1)
  nBckLineFdRg = 3
  
  ; 01 - Find the top and bottom zero regions (including the two very negative and very positive lines attaching to them    
  szIrisImgData = size(ref_mIrisImgData, /dimensions)
  
  ; Get the total value (by column)
  aTotVals = total(ref_mIrisImgData, 1)
  
  ; Find out which lines have total value as 0
  aDelLineIndexes = where(aTotVals eq 0)

  ; Divide these lines into two parts, in order to delete the strong white and black lines
  nStVal = find_contig(aDelLineIndexes, nStIndex, aIndexRange)
  
  szIndexRange = size(aIndexRange, /dimensions)
  if (szIndexRange[0] ne 2) || (szIndexRange[1] ne 2) then $
      message, 'This is not possible, I think'
  
  ; Get the original line index range (start position and end position) 
  aDelLineRange = aDelLineIndexes[aIndexRange]

  ; Get the delete line index (including the strong white and black lines)
  aDelLines = [ mo_gradeArray(aDelLineRange[0, 0], 1, aDelLineRange[0,1] + nStgLineWth), $
                mo_gradeArray(aDelLineRange[1, 0] - nStgLineWth, 1, aDelLineRange[1, 1]) ]
  
  ; 02 - Find the top and bottom two black lines
  if (aBadLinePos[0] ne -1) then begin
      for i = 0, n_elements(aBadLinePos) - 1 do begin
          ; Extract a few lines around the black line
          aExtLines = ref_mIrisImgData[ *, aBadLinePos[i] - nBckLineFdRg : aBadLinePos[i] + nBckLineFdRg ]
          
          ; Get the change of these lines (by line)
          szExtLines = size(aExtLines)
          aExtLineIndexes = indgen(szExtLines[2] - 1)
          ; The second line subtract the first line...
          aDerExtLines = aExtLines[*, aExtLineIndexes + 1] - aExtLines[*, aExtLineIndexes]

          ; Get the total value (by column)
          nTotExtVal = total(aDerExtLines, 1)
          
          ; Get the smallest and biggest change indexes
          _ = min(nTotExtVal, nMinIndex)     
          _ = max(nTotExtVal, nMaxIndex)
          
          ; Transform it into real line index (one larger for each side)
          nLineSt = aBadLinePos[i] - 3 + nMinIndex - 1
          nLineEd = aBadLinePos[i] - 3 + nMaxIndex + 1

          ; Delete a few more lines (The line is not just 1 pix width)
          aBlackLines = mo_gradeArray(nLineSt, 1, nLineEd)

          aDelLines = [aDelLines, aBlackLines]
      endfor
  endif 
  
  if (n_elements(aBadLinePosEx[0]) ne -1) then $
      aDelLines = [aDelLines, aBadLinePosEx]
     
  ; ref_mIrisImgData: [x, y]
  ref_mIrisImgData[*, aDelLines] = -1.
  
  ; tIrisData: [wave, y, x]
  if (n_elements(tIrisData) ne 0) then $
      tIrisData[*, aDelLines, *] = -1.
  
end