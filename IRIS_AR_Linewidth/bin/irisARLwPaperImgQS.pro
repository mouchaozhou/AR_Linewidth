pro irisARLwPaperImgQS

  ; Include the header file
  @irisARLw.in
  
  nStCaseNum = 33
  nEdCaseNum = 37 

  ; Include all the paths                   
  @include/irisARLwDirs2.in
  @include/irisARLwDirs3.in
  @test/include/irisARLwTestDirs2.in
  
  ; Output file
  file_mkdir, sAvgPaperImgDir
  sAvgPaperImgFile = sAvgPaperImgDir + 'paper_image_QS.eps'
  
  nTheoryWidth0 = 22D
  sTitle = 'Quiet Sun'
  
  irisARLwPaperImg, nStCaseNum, nEdCaseNum, sLineID, sAvgPaperImgFile, 'AvgWthSP_AverageSpWidth', $
                    'EchWthSP_EachSpWidth', sAvgQSFitTauSavDir, nTheoryWidth0, sTitle
  
  mo_done

end