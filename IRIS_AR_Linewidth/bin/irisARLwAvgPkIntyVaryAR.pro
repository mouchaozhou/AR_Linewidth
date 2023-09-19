;+
; :Description:
;    Peak intensity 的变化
;
; :Author: mcz
;-

pro irisARLwAvgPkIntyVaryAR

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
  
  file_mkdir, sAvgPkIntyVarImgDir
  sAvgPkIntyImgFile = sAvgPkIntyVarImgDir + 'Peak_Intensity_AR.eps'
                    
  
  uImgPars = { $
     sTitle : 'Peak intensity of average spectrum in AR', $
     aYrange : [0, 5], $  ; Normalization
     aYThresh : [0, 999999D] $
  }
  
  irisARLwAvgPkIntyVary, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', sAvgARFitTauSavDir, $
                         sAvgPkIntyImgFile, sLineID, uImgPars
                        
  mo_done

end