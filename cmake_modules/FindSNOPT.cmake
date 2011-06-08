FIND_PATH(SNOPT_INCLUDE_DIR 
cppsrc/snopt.hh
HINTS $ENV{SNOPT}
)

# includes
IF (SNOPT_INCLUDE_DIR)
   SET(SNOPT_FOUND_INCLUDE TRUE)
   SET(SNOPT_INCLUDE_DIRS ${SNOPT_INCLUDE_DIR} ${SNOPT_INCLUDE_DIR}/include)
   MESSAGE(STATUS "Found SNOPT include dir: ${SNOPT_INCLUDE_DIRS}")
ELSE (SNOPT_INCLUDE_DIR)
   MESSAGE(STATUS "Could not find SNOPT include dir")
ENDIF (SNOPT_INCLUDE_DIR)

# libraries
SET(SNOPT_LIBS_LIST
  snopt
  snopt_c
  snopt_cpp
  snprint
  snprintc
  f2c
)

SET(SNOPT_LIBRARIES )
FOREACH(LIB in ${SNOPT_LIBS_LIST})
  FIND_LIBRARY(SNOPT_LIB_${LIB}
    NAMES ${LIB}
    HINTS ${SNOPT_INCLUDE_DIR}/lib)
  IF(SNOPT_LIB_${LIB})
    #MESSAGE(STATUS "Found ${LIB}: ${SNOPT_LIB_${LIB}}")
    SET(SNOPT_LIBRARIES ${SNOPT_LIBRARIES} ${SNOPT_LIB_${LIB}})
  ELSE(SNOPT_LIB_${LIB})
    #MESSAGE(STATUS "Could not find lib${LIB}")
  ENDIF(SNOPT_LIB_${LIB})
ENDFOREACH(LIB)

IF (SNOPT_LIBRARIES)
   SET(SNOPT_LIBRARIES ${SNOPT_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${LAPACK_LIBRARIES} ${EXTRA_LIBRARIES} ${CMAKE_DL_LIBS})
   MESSAGE(STATUS "Found Snopt libs: ${SNOPT_LIBRARIES}")
   SET(SNOPT_FOUND_LIBS TRUE)
ELSE (SNOPT_LIBRARIES)
   MESSAGE(STATUS "Could not find Snopt libs")
ENDIF (SNOPT_LIBRARIES)


IF(SNOPT_FOUND_INCLUDE AND SNOPT_FOUND_LIBS)
  SET(SNOPT_FOUND TRUE)
ENDIF(SNOPT_FOUND_INCLUDE AND SNOPT_FOUND_LIBS)
