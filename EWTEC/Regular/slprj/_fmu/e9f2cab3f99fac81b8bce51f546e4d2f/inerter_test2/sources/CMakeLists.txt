cmake_minimum_required(VERSION 3.5)

set(FMU_NAME inerter_test2)

project(${FMU_NAME} C)

# FMU compilation options
set(BUILD_SHARED_LIBS
    ON
    CACHE BOOL
    "Compile DLL/Shared Object binary object if 'ON', compile static binary object if 'OFF'.")
set(FMI_INTERFACE_HEADER_FILES_DIRECTORY
    "C:/Program Files/OpenModelica1.24.3-64bit/include/omc/c/fmi"
    CACHE STRING
    "Path to FMI header files containing fmi2Functions.h, fmi2FunctionTypes.h, fmi2TypesPlatforms.h")
set(RUNTIME_DEPENDENCIES_LEVEL
    "modelica"
    CACHE STRING
    "Add modelica runtime dependencies to FMU if set to 'modelica'. Add system runtime dependencies as well if set to 'all'.")
set(NEED_CVODE
    OFF
    CACHE BOOL
    "FMU needs to link to SUNDIALS CVODE if 'ON'. Used for CoSimulation FMUs that want to use CVODE as integrator. Use 'OFF' otherwise.")
set(CVODE_DIRECTORY
    ""
    CACHE STRING
    "IF CVODE is needed provide a directory where to find it.")

# Test if RUNTIME_DEPENDENCIES is needed and available
if(${CMAKE_VERSION} VERSION_LESS "3.21" AND NOT ${RUNTIME_DEPENDENCIES_LEVEL} STREQUAL "none")
  message(FATAL_ERROR
          "--fmuRuntimeDepends=${RUNTIME_DEPENDENCIES_LEVEL} requires CMake version 3.21 or higher.\n"
          "You are running version ${CMAKE_VERSION}.\n"
          "Use OpenModelica compiler flag '--fmuRuntimeDepends=none' to disable including runtime dependencies into FMU.")
endif()

# Create position independent code for static libraries
if(NOT BUILD_SHARED_LIBS)
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

# Export all symbols on Windows
if(MSVC)
  set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
endif()

# FMI header files
if(NOT FMI_INTERFACE_HEADER_FILES_DIRECTORY)
  message(FATAL_ERROR "No FMI export headers provided. Set -DFMI_INTERFACE_HEADER_FILES_DIRECTORY=/path/to/fmi/headers")
endif()
find_file(FMI2_FUNCTIONS_H "fmi2Functions.h"
          PATHS ${FMI_INTERFACE_HEADER_FILES_DIRECTORY}
          NO_DEFAULT_PATH,
          NO_CMAKE_FIND_ROOT_PATH)
if(NOT FMI2_FUNCTIONS_H)
  message(FATAL_ERROR "Could not find fmi2Functions.h in FMI_INTERFACE_HEADER_FILES_DIRECTORY=${FMI_INTERFACE_HEADER_FILES_DIRECTORY}")
endif()
message(STATUS "FMI2 include directory: ${FMI_INTERFACE_HEADER_FILES_DIRECTORY}")


# Look for a threading library and see if it is PThreads.
find_package(Threads)
# If we find a threading library and it is PThreads then we enable its usage.
if(Threads_FOUND AND CMAKE_USE_PTHREADS_INIT)
  set(OM_HAVE_PTHREADS ON)
# Otherwise threading will be disabled.
else()
  set(OM_HAVE_PTHREADS OFF)
endif()

# Source files
file(GLOB_RECURSE FMU_RUNTIME_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/external_solvers/*.c
                                      ${CMAKE_CURRENT_SOURCE_DIR}/gc/*.c
                                      ${CMAKE_CURRENT_SOURCE_DIR}/math-support/pivot.c
                                      ${CMAKE_CURRENT_SOURCE_DIR}/meta/*.c
                                      ${CMAKE_CURRENT_SOURCE_DIR}/simulation/*.c
                                      ${CMAKE_CURRENT_SOURCE_DIR}/util/*.c)
if (NOT ${NEED_CVODE})
  list(REMOVE_ITEM FMU_RUNTIME_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/simulation/solver/sundials_error.c
                                       ${CMAKE_CURRENT_SOURCE_DIR}/simulation/solver/cvode_solver.c)
endif()
file(GLOB FMU_GENERATED_MODEL_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.c)

# Set install prefix to FMU target system short and architecture
if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
  set(FMU_TARGET_SYSTEM_NAME "win")
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
  set(FMU_TARGET_SYSTEM_NAME "linux")
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
  set(FMU_TARGET_SYSTEM_NAME "darwin")
else()
  message(FATAL_ERROR "Unknown target system: ${CMAKE_SYSTEM_NAME}")
endif()

if(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
  set(FMU_TARGET_PLATFORM "${FMU_TARGET_SYSTEM_NAME}64")
else()
  set(FMU_TARGET_PLATFORM "${FMU_TARGET_SYSTEM_NAME}32")
endif()

message(STATUS "Building for FMI platform ${FMU_TARGET_PLATFORM}")

set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/../binaries/${FMU_TARGET_PLATFORM})
set(CMAKE_INSTALL_LIBDIR ${CMAKE_INSTALL_PREFIX})
set(CMAKE_INSTALL_BINDIR ${CMAKE_INSTALL_PREFIX})
set(CMAKE_SHARED_LIBRARY_PREFIX "")
set(CMAKE_STATIC_LIBRARY_PREFIX "")
message(STATUS "Install directory: ${CMAKE_INSTALL_PREFIX}")

# Set RPATH
if(APPLE)
  set(CMAKE_INSTALL_RPATH "@loader_path")
else()
  if(${NEED_CVODE} AND RUNTIME_DEPENDENCIES_LEVEL STREQUAL "none")
    set(CMAKE_INSTALL_RPATH_USE_LINK_PATH True)
  endif()
  set(CMAKE_INSTALL_RPATH "$ORIGIN")
endif()

# Target library
add_library(${FMU_NAME}
            ${FMU_RUNTIME_SOURCES}
            ${FMU_GENERATED_MODEL_SOURCES})

# Linker options
if(NOT ${CMAKE_VERSION} VERSION_LESS "3.13")
  if(CMAKE_C_COMPILER_ID STREQUAL "Clang" OR CMAKE_C_COMPILER_ID STREQUAL "AppleClang")  # Using Clang
    target_link_options(${FMU_NAME} PRIVATE "LINKER:SHELL:-undefined,error")
  elseif(CMAKE_C_COMPILER_ID STREQUAL "GNU")  # Using GCC
    target_link_options(${FMU_NAME} PRIVATE "LINKER:SHELL:--no-undefined")
  endif()
endif()

# If we have PThreads support, define OM_HAVE_PTHREADS and link to the imported threading library.
if(OM_HAVE_PTHREADS)
  target_compile_definitions(${FMU_NAME} PRIVATE OM_HAVE_PTHREADS)
  target_link_libraries(${FMU_NAME} PRIVATE Threads::Threads)
endif()

# If not using MSVC, link to the math library libm.
if(NOT MSVC)
  target_link_libraries(${FMU_NAME} PRIVATE m)
endif()

set(EXTERNAL_LIBDIRECTORIES "${DOCKER_VOL_DIR}C:/Program Files/OpenModelica1.24.3-64bit/bin"
                            "${DOCKER_VOL_DIR}C:/Program Files/OpenModelica1.24.3-64bit/lib/${CMAKE_LIBRARY_ARCHITECTURE}/omc")


if(${NEED_CVODE})
  # Force static compilation on Windows or if CMake is too old
  if(WIN32 OR (${CMAKE_VERSION} VERSION_LESS "3.21" AND NOT ${RUNTIME_DEPENDENCIES_LEVEL} STREQUAL "none"))
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a .lib)
    target_compile_definitions(${FMU_NAME} PRIVATE LINK_SUNDIALS_STATIC)
  endif()

  message(STATUS "CVODE_DIRECTORY: ${CVODE_DIRECTORY}")
  find_library(SUNDIALS_CVODE_LIBRARY sundials_cvode
               PATHS ${CVODE_DIRECTORY}
               NO_DEFAULT_PATH
               NO_SYSTEM_ENVIRONMENT_PATH
               REQUIRED)
  if(NOT SUNDIALS_CVODE_LIBRARY)
    message(FATAL_ERROR "Couldn't find library sundials_cvode in ${CVODE_DIRECTORY}")
  endif()
  message(STATUS "SUNDIALS_CVODE_LIBRARY: ${SUNDIALS_CVODE_LIBRARY}")
  list(APPEND RUNTIME_DEPENDS ${SUNDIALS_CVODE_LIBRARY})

  find_library(SUNDIALS_NVECSERIAL_LIBRARY sundials_nvecserial
               PATHS ${CVODE_DIRECTORY}
               NO_DEFAULT_PATH
               NO_SYSTEM_ENVIRONMENT_PATH
               REQUIRED)
  if(NOT SUNDIALS_NVECSERIAL_LIBRARY)
    message(FATAL_ERROR "Couldn't find library sundials_nvecserial in ${CVODE_DIRECTORY}")
  endif()
  message(STATUS "SUNDIALS_NVECSERIAL_LIBRARY: ${SUNDIALS_NVECSERIAL_LIBRARY}")
  list(APPEND RUNTIME_DEPENDS ${SUNDIALS_NVECSERIAL_LIBRARY})

  target_link_libraries(${FMU_NAME} PRIVATE ${SUNDIALS_NVECSERIAL_LIBRARY})
  target_link_libraries(${FMU_NAME} PRIVATE ${SUNDIALS_CVODE_LIBRARY})
  target_include_directories(${FMU_NAME} PRIVATE sundials)
  set(WITH_SUNDIALS ";WITH_SUNDIALS")
  message(STATUS "CVODE: ${SUNDIALS_NVECSERIAL_LIBRARY} ${SUNDIALS_CVODE_LIBRARY}")
else()
  message(STATUS "CVODE: Not linked")
endif()

# Add include directories
target_include_directories(${FMU_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(${FMU_NAME} PRIVATE ${FMI_INTERFACE_HEADER_FILES_DIRECTORY}
                                               sundials)

# Set compiler definitions
target_compile_definitions(${FMU_NAME} PRIVATE OMC_MINIMAL_RUNTIME=1;OMC_FMI_RUNTIME=1;CMINPACK_NO_DLL${WITH_SUNDIALS})

if(BUILD_SHARED_LIBS)
  # Override FMI2_FUNCTION_PREFIX if FMU compiled dynamically
  target_compile_definitions(${FMU_NAME} PRIVATE FMI2_OVERRIDE_FUNCTION_PREFIX)
  message(STATUS "Not using FMI2_FUNCTION_PREFIX")
else()
  message(STATUS "Using FMI2_FUNCTION_PREFIX")
endif()

# Install target
if(RUNTIME_DEPENDENCIES_LEVEL STREQUAL "all")
  install(TARGETS ${FMU_NAME}
    RUNTIME_DEPENDENCIES
      DIRECTORIES ${EXTERNAL_LIBDIRECTORIES} ${CVODE_DIRECTORY}
    PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR})
elseif(RUNTIME_DEPENDENCIES_LEVEL STREQUAL "modelica")
  message(STATUS "Installing dynamic dependencies from list: ${RUNTIME_DEPENDS}")
  install(TARGETS ${FMU_NAME}
    RUNTIME_DEPENDENCIES
      DIRECTORIES ${EXTERNAL_LIBDIRECTORIES} ${CVODE_DIRECTORY}
      PRE_EXCLUDE_REGEXES "api-ms-" "ext-ms-"
      POST_EXCLUDE_REGEXES "^\\/lib.*" "^\\/usr\\/lib.*" "^\\/usr\\/local\\/lib.*" ".*system32/.*\\.dll"
      POST_INCLUDE_FILES ${RUNTIME_DEPENDS}
    PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR})
else()
  install(TARGETS ${FMU_NAME}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR})
endif()

# Zip target creating modelname.fmu
add_custom_target(create_fmu
    COMMAND "${CMAKE_COMMAND}" --build ${CMAKE_BINARY_DIR} --target install
    COMMAND "${CMAKE_COMMAND}" -E tar "cfv" "../inerter_test2.fmu" --format=zip
      "binaries/"
      "resources/"
      "sources/"
      "modelDescription.xml"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../")
