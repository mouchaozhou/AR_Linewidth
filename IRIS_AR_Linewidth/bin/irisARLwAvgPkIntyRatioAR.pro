pro irisARLwAvgPkIntyRatioAR

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 15
  nEdCaseNum = 32 
  
  ; Include all the paths                   
  @include/irisARLwDirs2.in
  
  file_mkdir, sAvgPkIntyRatVarImgDir
  sAvgPkIntyRatVarImgFile = sAvgPkIntyRatVarImgDir + 'peak_intensity_ratio_AR.eps'
  
  irisARLwAvgPkIntyRatio, nStCaseNum, nEdCaseNum, 'AvgWthSP_AverageSpWidth', sAvgPkIntyRatVarImgFile, $
                          sAvgARFitTauSavDir

  mo_done
  
end