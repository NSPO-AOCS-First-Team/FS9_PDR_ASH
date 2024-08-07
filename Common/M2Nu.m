function nu = M2Nu( e, M, tol, nMax )

%% Computes the true anomaly from the mean anomaly.
%
%   Since version 1.
%--------------------------------------------------------------------------
%   Form:
%   nu  = M2Nu( e, M, tol, nMax )
%--------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e               (1,1)  Eccentricity
%   M               (1,:)  Mean anomaly (rad)
%   tol             (1,1)  Tolerance
%   nMax            (1,1)  Maximum number of iterations
%
%   -------
%   Outputs
%   -------
%   nu              (1,:)  True anomaly (rad)
%
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%	 Copyright (c) 1996-1998 Princeton Satellite Systems, Inc.
%    All rights reserved.
%--------------------------------------------------------------------------

if( nargin < 2 )
  M = linspace(0,2*pi);
end

if( nargin>2 && isempty(tol) )
  tol = 1e-14;
end

if( e ~= 1 )
  if( nargin < 3 )
    E = M2E( e, M );
  elseif( nargin < 4 ) 
    E = M2E( e, M, tol );
  else
    E = M2E( e, M, tol, nMax );
  end
  nu = E2Nu( e, E );
else
  nu = M2NuPb( M );
end

if( nargout == 0 )
  Plot2D(M,nu,'Mean Anomaly','True Anomaly')
  clear nu
end

% PSS internal file version information
%--------------------------------------
% $Date: 2017-05-11 16:08:09 -0400 (Thu, 11 May 2017) $
% $Revision: 44568 $
