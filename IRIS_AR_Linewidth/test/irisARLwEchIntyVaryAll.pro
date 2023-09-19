pro irisARLwEchIntyVaryAll

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
  @test/include/irisARLwTestDirs2.in
  
  file_mkdir, sEchIntyVarImgDir
  sEchIntyVarImgFile = sEchIntyVarImgDir + 'Intensity_All.eps' 

  uImgPars = { $
     sTitle : 'Intensity of average of individual spectrums in All', $
     aYrange : [0, 5], $  ; Normalization
     aYThresh : [0, 999999D] $
  }
  
  irisARLwEchIntyVary, nStCaseNum, nEdCaseNum, 'EchWthAll_EachAllWidth', sEchAllFitTauSavDir, $
                       sEchIntyVarImgFile, sLineID, uImgPars
                        
  mo_done

end