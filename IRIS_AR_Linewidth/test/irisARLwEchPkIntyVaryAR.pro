pro irisARLwEchPkIntyVaryAR

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
  
  file_mkdir, sEchPkIntyVarImgDir
  sEchPkIntyImgFile = sEchPkIntyVarImgDir + 'Peak_Intensity_AR.eps' 

  uImgPars = { $
     sTitle : 'Peak intensity of average of individual spectrums in AR', $
     aYrange : [0, 5], $  ; Normalization
     aYThresh : [0, 999999D] $
  }
  
  irisARLwEchPkIntyVary, nStCaseNum, nEdCaseNum, 'EchWthSP_EachSpWidth', sEchARFitTauSavDir, $
                         sEchPkIntyImgFile, sLineID, uImgPars
                        
  mo_done

end