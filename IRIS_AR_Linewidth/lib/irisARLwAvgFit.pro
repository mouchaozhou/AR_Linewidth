pro irisARLwAvgFit, sAvgFitSavDir, tIrisData, oIrisObj, nWaveWin, aLineRg, aContRg, mMask

  ; Create the output dirs
  file_mkdir, sAvgFitSavDir

  ; Resolve object methods
  resolve_object, oIrisObj

  ; #summary
  ;   To get the same dimension with 3D data
  ;   Remember we transpose the data when we create the image,
  ; here we need to restore it.
  ;   Original mMask: [x, y]
  ;   Transposed mMask: [y, x], this will be compatible with 3D 
  ; spectrum data
  ; #endsum
  mMask = transpose(mMask)

  ; Get the zero indexes in mask 
  mZeroId = where2d(mMask eq 0, nNId) 
  ; #summary
  ;   mZeroId =
  ;     [ [X0, Y0],   X0 = y0  Y0 = x0
  ;       [X1, Y1],   X1 = y1  Y1 = x1
  ;       ...  ...
  ;       [Xn, Yn] ]  Xn = yn  Yn = xn
  ;
  ;   Remember that we have transposed the mMask Xn and Yn
  ; are compatible with 3D spectrum data structure [wave, y, x].
  ; #endsum

  ; Filterate the spectrum
  for i = 0L, nNId - 1 do begin
      ; Make the spectrums at useless points have values of 0 acrossing whole wavelength range
      tIrisData[*, mZeroId[0, i], mZeroId[1, i]] *= 0
  endfor

  ; Get the Doppler speed as x data
  aVelXs = mo_wavelen2Velocity(oIrisObj->getlam(nWaveWin))
  aVelXs = aVelXs[aLineRg[0] : aLineRg[1]]
  
  ; Calculate the mean spectrum
  nNSpPts = n_elements(where(mMask eq 1))
  ; Total spectrum / number of points whose spectrum are involved in calculation
  aAvgSpRaw = mo_irisTotalSpectrum(tIrisData) / nNSpPts
  aAvgSp = aAvgSpRaw[aLineRg[0] : aLineRg[1]]

  ; Calculate the y data to be fitted
  aCont = aAvgSpRaw[aContRg[0] : aContRg[1]] 
  aAvgCont = mean(aCont) 
  aAvgSp -= aAvgCont

  ; Gaussian fitting
  mo_profileMoment, aVelXs, aAvgSp, $
                    ; @out
                    nLinePosition=nLinePosition, nWidth=nWidth, nArea=nArea

  mo_mpFitFun, aVelXs, aAvgSp, 'mo_gaussFun', [nLinePosition, nWidth, nArea], mo_gaussErrs(aAvgSp), $
             ; @out
               aFitYs=aFitYs, aFitPars=aFitPars, aParCErrs=aParCErrs, $
               aParErrs=aParErrs, nChisq=nChisq, nRChisq=nRChisq, nDof=nDof
                                   

  ; #region =============================================================================================================                       
  ; Some variables to save
  ;
  
  ; Save some vaules for possible use
  uAvgFitRes = { $
      aFitYs : aFitYs,     $
      aFitPars : aFitPars, $  ; [nLinePosition, nWidth, nArea]
      aParErrs : aParErrs, $
      aParCErrs: aParCErrs,$
      nChisq  : nChisq,    $
      nRChisq : nRChisq,   $
      nDof    : nDof       $
   }
  
  ; The center coordinates
  nXCen = oIrisObj->getxcen(nWaveWin)
  nYCen = oIrisObj->getycen(nWaveWin)
  
  ; #summary
  ;   Save the variables
  ;   aVelXs: the Doppler speed array (x data)
  ;   aAvgSp: the average spectrum (y data)
  ;   uAvgFitRes: the fitting results
  ;   nXCen, nYCen: the center coordinates
  ; #endsum
  save, aVelXs, aAvgSp, uAvgFitRes, nXCen, nYCen, filename=sAvgFitSavDir + 'fitting_results.sav'
  ; #endregion ===========================================================================================================                                          

end
