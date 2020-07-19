cmake_minimum_required (VERSION 3.5)

add_library(cpprest_static STATIC IMPORTED)
set_property(TARGET cpprest_static PROPERTY IMPORTED_LOCATION
    "${CPPREST_STATIC_LIBRARY_DIR}/libcpprest.a"
)
set(CPPREST_LIB "cpprest_static")


find_package(OpenSSL 1.0.0 REQUIRED)
set(Boost_USE_STATIC_LIBS ON)
find_package(Boost REQUIRED COMPONENTS system thread chrono)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration -ldl")


add_executable(Demo Demo.cpp)
target_link_libraries(Demo  
${CPPREST_LIB} 
OpenSSL::SSL
OpenSSL::Crypto
Boost::boost
Boost::system
Boost::chrono
Boost::thread
)


include_directories(
  ${CPPREST_INCLUDE_DIR}
  ${OPENSSL_INCLUDE_DIR}
)
  
link_directories(
    ${CPPREST_LIBRARY_DIR}
)
