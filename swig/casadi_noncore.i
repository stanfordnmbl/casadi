/*
 *    This file is part of CasADi.
 *
 *    CasADi -- A symbolic framework for dynamic optimization.
 *    Copyright (C) 2010 by Joel Andersson, Moritz Diehl, K.U.Leuven. All rights reserved.
 *
 *    CasADi is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Lesser General Public
 *    License as published by the Free Software Foundation; either
 *    version 3 of the License, or (at your option) any later version.
 *
 *    CasADi is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public
 *    License along with CasADi; if not, write to the Free Software
 *    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

#ifdef WITH_SWIG_SPLIT
%module casadi_noncore

%include "common.i"

%import "casadi_primitive_tools.i"
#endif //WITH_SWIG_SPLIT


// FX
%include "casadi_fx.i"

// integration
%include "casadi_integration.i"

// optimal_control
%include "casadi_optimal_control.i"

// nonlinear programming
%include "casadi_nonlinear_programming.i"

// interfaces
%include "casadi_interfaces.i"


