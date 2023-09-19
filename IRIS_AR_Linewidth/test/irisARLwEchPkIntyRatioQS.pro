pro irisARLwEchPkIntyRatioQS

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 33
  nEdCaseNum = 37 
  
  ; Include all the paths                   
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sEchPkIntyRatVarImgDir
  sEchPkIntyRatVarImgFile = sEchPkIntyRatVarImgDir + 'peak_intensity_ratio_QS.eps'
  
  irisARLwEchPkIntyRatio, nStCaseNum, nEdCaseNum, 'EchWthSP_EachSpWidth', sEchPkIntyRatVarImgFile, $
                          sEchQSFitTauSavDir

  mo_done
  
end