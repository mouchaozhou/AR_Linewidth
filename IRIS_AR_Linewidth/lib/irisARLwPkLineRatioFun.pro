;+
; :Description:
;    This is the input function for mpfitfun function to fit the equation
;                  (1 - exp(-τ0 / μ))
;            r =  -------------------------
;                  (1 - exp(-0.5*τ0 / μ))
;
; :Params:
;    x(mu): μ = cosθ,  input variables
;    p(tau0): τ0, the to fit parameter
;
; :Author: mcz
;-

function irisARLwPkLineRatioFun, x, p

	; The parameter name of this function must be x, p, other names don't work. Damn~
  y = (1D - exp(-p[0] / x)) / (1D - exp(-0.5D*p[0] / x))
  
	return, y
  
end



function irisARLwIntyFun, x, p

  y = 1D - exp(-p[0] / x)
  
  return, y
  
end