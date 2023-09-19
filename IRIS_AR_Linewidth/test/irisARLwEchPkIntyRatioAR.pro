pro irisARLwEchPkIntyRatioAR

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 15
  nEdCaseNum = 32 
  
  ; Include all the paths                   
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sEchPkIntyRatVarImgDir
  sEchPkIntyRatVarImgFile = sEchPkIntyRatVarImgDir + 'peak_intensity_ratio_AR.eps'
  
  irisARLwEchPkIntyRatio, nStCaseNum, nEdCaseNum, 'EchWthSP_EachSpWidth', sEchPkIntyRatVarImgFile, $
                          sEchARFitTauSavDir

  mo_done
  
end