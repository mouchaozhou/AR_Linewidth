;+
; :Description:
;    Total intensity 的变化
;
; :Author: mcz
;-

pro irisARLwAvgIntyVaryAR

  ; Include the header file
  @irisARLw.in
  
  if (sLineID eq 'SIIV1394') then begin
      nStCaseNum = 1
  endif $
  else begin
      nStCaseNum = 15
  endelse
  nEdCaseNum = 32 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgIntyVarImgDir
  sAvgIntyVarImgFile = sAvgIntyVarImgDir + 'Intensity_AR.eps' 

  uImgPars = { $
     sTitle : 'Intensity of average spectrum in AR', $
     aYrange : [0, 5], $  ; Normalization
     aYThresh : [0, 999999D] $
  }
  
  irisARLwAvgIntyVary, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', sAvgARFitTauSavDir, $
                       sAvgIntyVarImgFile, sLineID, uImgPars
                        
  mo_done

end