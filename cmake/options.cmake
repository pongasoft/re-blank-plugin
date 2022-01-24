cmake_minimum_required(VERSION 3.17)

#################
# re-cmake
#################
set(re-cmake_GIT_TAG "v1.4.2" CACHE STRING "re-cmake git tag")
set(re-cmake_GIT_REPO "https://github.com/pongasoft/re-cmake" CACHE STRING "re-cmake git repository url")

# Uncomment/set to proper value if local instead of remote
set(re-cmake_ROOT_DIR "") # use remote re-cmake
#set(re-cmake_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../../pongasoft/re-cmake")

#################
# re-logging (tag/repo defined by re-cmake but can override here)
#################
#set(re-logging_GIT_TAG "<tag goes here>" CACHE STRING "re-logging git tag")
#set(re-logging_GIT_REPO "https://github.com/pongasoft/re-mock" CACHE STRING "re-logging git repository url")

# Uncomment/set to proper value if local instead of remote
set(re-logging_ROOT_DIR "") # use remote re-logging
#set(re-logging_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../pongasoft/re-logging")

#################
# re-mock (tag/repo defined by re-cmake but can override here)
#################
#set(re-mock_GIT_TAG "<tag goes here>" CACHE STRING "re-mock git tag")
#set(re-mock_GIT_REPO "https://github.com/pongasoft/re-mock" CACHE STRING "re-mock git repository url")

# Uncomment/set to proper value if local instead of remote
set(re-mock_ROOT_DIR "") # use remote re-mock
#set(re-mock_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../pongasoft/re-mock")

# Uncomment if you want to load/save samples with re-mock
#option(RE_MOCK_SUPPORT_FOR_AUDIO_FILE "" ON)

#################
# googletest (tag/repo defined by re-cmake but can override here)
#################
#set(googletest_GIT_TAG "<tag goes here>" CACHE STRING "googletest git tag")
#set(googletest_GIT_REPO "https://github.com/google/googletest" CACHE STRING "googletest git repository URL")

# Uncomment/set to proper value if local instead of remote
set(googletest_ROOT_DIR "") # use remote googletest
#set(re-googletest_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../google/googletest")

