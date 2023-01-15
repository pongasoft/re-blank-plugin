cmake_minimum_required(VERSION 3.24)

#################
# re-cmake
#################
set(re-cmake_GIT_TAG "v1.5.0" CACHE STRING "re-cmake git tag")
set(re-cmake_GIT_REPO "https://github.com/pongasoft/re-cmake" CACHE STRING "re-cmake git repository url")
set(re-cmake_DOWNLOAD_URL "${re-cmake_GIT_REPO}/archive/refs/tags/${re-cmake_GIT_TAG}.zip" CACHE STRING "re-cmake download url" FORCE)

# Uncomment/set to proper value if local instead of remote
set(re-cmake_ROOT_DIR "") # use remote re-cmake
#set(re-cmake_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../../pongasoft/re-cmake")

#################
# re-logging
#################
set(re-logging_GIT_REPO "https://github.com/pongasoft/re-logging" CACHE STRING "re-logging git repository url")
set(re-logging_GIT_TAG "v1.0.1" CACHE STRING "re-logging git tag")
set(re-logging_DOWNLOAD_URL "${re-logging_GIT_REPO}/archive/refs/tags/${re-logging_GIT_TAG}.zip" CACHE STRING "re-logging download url" FORCE)

# Uncomment/set to proper value if local instead of remote
set(re-logging_ROOT_DIR "") # use remote re-logging
#set(re-logging_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../pongasoft/re-logging")

#################
# re-mock
#################
set(re-mock_GIT_REPO "https://github.com/pongasoft/re-mock" CACHE STRING "re-mock git repository url")
set(re-mock_GIT_TAG "v1.3.2" CACHE STRING "re-mock git tag")
set(re-mock_DOWNLOAD_URL "${re-mock_GIT_REPO}/archive/refs/tags/${re-mock_GIT_TAG}.zip" CACHE STRING "re-mock download url" FORCE)

# Uncomment/set to proper value if local instead of remote
set(re-mock_ROOT_DIR "") # use remote re-mock
#set(re-mock_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../pongasoft/re-mock")

# Set to ON if want to load/save samples with re-mock
option(RE_MOCK_SUPPORT_FOR_AUDIO_FILE "" OFF)

#################
# googletest
#################
set(googletest_GIT_REPO "https://github.com/google/googletest" CACHE STRING "googletest git repository URL")
set(googletest_GIT_TAG "release-1.12.1" CACHE STRING "googletest git tag")
set(googletest_DOWNLOAD_URL "${googletest_GIT_REPO}/archive/refs/tags/${googletest_GIT_TAG}.zip" CACHE STRING "googletest download url" FORCE)

# Uncomment/set to proper value if local instead of remote
set(googletest_ROOT_DIR "") # use remote googletest
#set(re-googletest_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../google/googletest")

