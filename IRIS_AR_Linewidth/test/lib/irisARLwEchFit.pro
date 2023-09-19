pro irisARLwEchFit, sEchFitSavDir, tIrisData, oIrisObj, nWaveWin, aLineRg, aContRg, mMask

  ; Create the output dirs
  file_mkdir, sEchFitSavDir

  ; Resolve object methods
  resolve_object, oIrisObj
  
  szIrisData = size(tIrisData,/dimensions)
  
  ; #summary
  ;   To get the same dimension with 3D data
  ;   Remember we transpose the data when we create the image,
  ; here we need to restore it.
  ;   Original mMask: [x, y]
  ;   Transposed mMask: [y, x], this will be compatible with 3D 
  ; spectrum data
  ; #endsum
  mMask = transpose(mMask)
  
  ; Create an array to store the raw data
  pmVelXs = ptrarr(szIrisData[1], szIrisData[2], /allocate_heap)
  pmEchSp = ptrarr(szIrisData[1], szIrisData[2], /allocate_heap)
  
  ; Creat a struct and save some vaules for possible use
  uEchFitRes = { $
    pmFitYs : ptrarr(szIrisData[1], szIrisData[2], /allocate_heap), $
    tFitPars : dblarr(szIrisData[1], szIrisData[2], 3),  $  ; [nLinePosition, nWidth, nArea]
    tParErrs : dblarr(szIrisData[1], szIrisData[2], 3),  $
    tParCErrs: dblarr(szIrisData[1], szIrisData[2], 3),  $
    mChisq  : dblarr(szIrisData[1], szIrisData[2]),      $
    mRChisq : dblarr(szIrisData[1], szIrisData[2]),      $
    mDof    : dblarr(szIrisData[1], szIrisData[2])       $
  }
  
  ; Get the non-zero indexes in mask (0 value means they aren't needed to fit)
  mNonZeroId = where2d(mMask ne 0, nNId) 
  ; #summary
  ;   mNonZeroId =
  ;     [ [X0, Y0],   X0 = y0  Y0 = x0
  ;       [X1, Y1],   X1 = y1  Y1 = x1
  ;       ...  ...
  ;       [Xn, Yn] ]  Xn = yn  Yn = xn
  ;
  ;   Remember that we have transposed the mMask Xn and Yn
  ; are compatible with 3D spectrum data structure [wave, y, x].
  ; #endsum
  
  for i = 0L, nNId - 1 do begin 
      ; Calculate the average continuum
      aCont = tIrisData[aContRg[0] : aContRg[1], mNonZeroId[0, i], mNonZeroId[1, i]]
      aAvgCont = mean(aCont)     
      ; Get the fitting y data
      aEchSp = tIrisData[aLineRg[0] : aLineRg[1], mNonZeroId[0, i], mNonZeroId[1, i]] - aAvgCont
      ; Get the fitting x data (mistake, for each data point this should be the same)
      aVelXs = mo_wavelen2Velocity(oIrisObj->getlam(nWaveWin))
      aVelXs = aVelXs[aLineRg[0] : aLineRg[1]]
    
      ; Calculate the first and second moments as the initial fitting parameters
      mo_profileMoment, aVelXs, aEchSp, $
                      ; @out
                      nLinePosition=nLinePosition, nWidth=nWidth, nArea=nArea

      ; Curve fitting (Singal Gaussian fitting)
      mo_mpFitFun, aVelXs, aEchSp, 'mo_gaussFun', [nLinePosition, nWidth, nArea], mo_gaussErrs(aEchSp), $
                 ; @out
                   aFitYs=aFitYs, aFitPars=aFitPars, aParCErrs=aParCErrs, $
                   aParErrs=aParErrs, nChisq=nChisq, nRChisq=nRChisq, nDof=nDof
  
      ; Save the original spectrum x and y data (compatible to 3D data structure [y, x])
      *pmVelXs[mNonZeroId[0, i], mNonZeroId[1, i]] = aVelXs
      *pmEchSp[mNonZeroId[0, i], mNonZeroId[1, i]] = aEchSp
      
      ; Save other data
      if (finite(aFitPars[1]) && (aFitPars[1] gt 0)) then begin ; No need to save the NaN
          ; Save the fitted data
          *uEchFitRes.pmFitYs[mNonZeroId[0, i], mNonZeroId[1, i]] = aFitYs
          uEchFitRes.tFitPars[mNonZeroId[0, i], mNonZeroId[1, i], *] = aFitPars
          uEchFitRes.tParErrs[mNonZeroId[0, i], mNonZeroId[1, i], *] = aParErrs
          uEchFitRes.tParCErrs[mNonZeroId[0, i], mNonZeroId[1, i], *] = aParCErrs
          uEchFitRes.mChisq[mNonZeroId[0, i], mNonZeroId[1, i]] = nChisq
          uEchFitRes.mRChisq[mNonZeroId[0, i], mNonZeroId[1, i]] = nRChisq
          uEchFitRes.mDof[mNonZeroId[0, i], mNonZeroId[1, i]] = nDof
      endif
  endfor
  
  ; The center coordinates
  nXCen = oIrisObj->getxcen(nWaveWin)
  nYCen = oIrisObj->getycen(nWaveWin)
  
  ; #summary
  ;   Save the variables
  ;   pmVelXs: the Doppler speed array (x data)
  ;   pmEchSp: the average spectrum (y data)
  ;   uEchFitRes: the fitting results
  ;   nXCen, nYCen: the center coordinates
  ; #endsum
  save, pmVelXs, pmEchSp, uEchFitRes, nXCen, nYCen, filename=sEchFitSavDir + 'fitting_results.sav'

  obj_destroy, oIrisObj

end