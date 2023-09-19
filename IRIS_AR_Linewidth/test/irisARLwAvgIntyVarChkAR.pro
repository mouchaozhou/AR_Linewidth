pro irisARLwAvgIntyVarChkAR

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
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sAvgIntyVarChkARImgDir

  uImgPars = { $
     sTitle : 'Intensity of average spectrum in AR', $
     aYrange : [0, 5], $  ; Normalization
     aYThresh : [0, 999999D] $
  }
  
  irisARLwAvgIntyVarChk, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', sAvgARFitTauSavDir, $
                         sAvgIntyVarChkARImgDir, sLineID, uImgPars
                        
  mo_done

end