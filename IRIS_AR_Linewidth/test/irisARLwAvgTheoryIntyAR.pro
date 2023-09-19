pro irisARLwAvgTheoryIntyAR

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
  @test/include/irisARLwTestDirs3.in
  
  file_mkdir, sAvgTheoryIntyImgDir
  sAvgTheoryIntyImgFile = sAvgTheoryIntyImgDir + 'avg_theory_intensity.eps' 

  uImgPars = { $
     aYrange : [0, 5], $  ; Normalization
     sTitle : 'Theory intensity in AR' $ 
  }
  
  irisARLwAvgTheoryInty, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', 'AvgFitSP_FittingResults', $
                         sAvgARFitTauSavDir, sAvgTheoryIntyImgFile, sLineID, uImgPars

end