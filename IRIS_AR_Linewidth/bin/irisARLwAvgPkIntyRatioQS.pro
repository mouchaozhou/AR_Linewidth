pro irisARLwAvgPkIntyRatioQS

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 33
  nEdCaseNum = 37 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgPkIntyRatVarImgDir
  sAvgPkIntyRatVarImgFile = sAvgPkIntyRatVarImgDir + 'peak_intensity_ratio_QS.eps'
  
  irisARLwAvgPkIntyRatio, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', sAvgPkIntyRatVarImgFile, $
                          sAvgQSFitTauSavDir

  mo_done
  
end