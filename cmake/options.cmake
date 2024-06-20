cmake_minimum_required(VERSION 3.24)

#################
# re-cmake
#################
set(re-cmake_GIT_TAG "v1.7.2" CACHE STRING "re-cmake git tag")
set(re-cmake_GIT_REPO "https://github.com/pongasoft/re-cmake" CACHE STRING "re-cmake git repository url")
set(re-cmake_DOWNLOAD_URL "${re-cmake_GIT_REPO}/archive/refs/tags/${re-cmake_GIT_TAG}.zip" CACHE STRING "re-cmake download url" FORCE)
set(re-cmake_DOWNLOAD_URL_HASH "SHA256=5859a13293ef1638879b5bfb7d25fa1c51c5a83b443ffc2736edf25e4aca49e4" CACHE STRING "re-cmake download url hash" FORCE)

# Uncomment/set to proper value if local instead of remote
set(re-cmake_ROOT_DIR "") # use remote re-cmake
#set(re-cmake_ROOT_DIR "${RE_PROJECT_ROOT_DIR}/../../pongasoft/re-cmake")

#################
# re-logging
#################
set(re-logging_GIT_REPO "https://github.com/pongasoft/re-logging" CACHE STRING "re-logging git repository url")
set(re-logging_GIT_TAG "v1.0.1" CACHE STRING "re-logging git tag")
set(re-logging_DOWNLOAD_URL "${re-logging_GIT_REPO}/archive/refs/tags/${re-logging_GIT_TAG}.zip" CACHE STRING "re-logging download url" FORCE)
set(re-logging_DOWNLOAD_URL_HASH "SHA256=e71898bfb4234505e5714a726139ad21ac0bd17d63f41af80d7cc9b5760dd57f" CACHE STRING "re-logging download url hash" FORCE)

# Uncomment/set to proper value if local instead of remote
set(re-logging_ROOT_DIR "") # use remote re-logging
#set(re-logging_ROOT_DIR "${RE_PROJECT_ROOT_DIR}/../../pongasoft/re-logging")

#################
# re-mock
#################
set(re-mock_GIT_REPO "https://github.com/pongasoft/re-mock" CACHE STRING "re-mock git repository url")
set(re-mock_GIT_TAG "v1.6.0" CACHE STRING "re-mock git tag")
set(re-mock_DOWNLOAD_URL "${re-mock_GIT_REPO}/archive/refs/tags/${re-mock_GIT_TAG}.zip" CACHE STRING "re-mock download url" FORCE)
set(re-mock_DOWNLOAD_URL_HASH "SHA256=6879590c88ae318c57ff01e57c322e85ec7f598543cfe4eca99b728600b4b89e" CACHE STRING "re-mock download url hash" FORCE)

# Uncomment/set to proper value if local instead of remote
set(re-mock_ROOT_DIR "") # use remote re-mock
#set(re-mock_ROOT_DIR "${RE_PROJECT_ROOT_DIR}/../../pongasoft/re-mock")

#################
# googletest
#################
set(googletest_GIT_REPO "https://github.com/google/googletest" CACHE STRING "googletest git repository URL")
set(googletest_GIT_TAG "v1.13.0" CACHE STRING "googletest git tag")
set(googletest_DOWNLOAD_URL "${googletest_GIT_REPO}/archive/refs/tags/${googletest_GIT_TAG}.zip" CACHE STRING "googletest download url" FORCE)
set(googletest_DOWNLOAD_URL_HASH "SHA256=ffa17fbc5953900994e2deec164bb8949879ea09b411e07f215bfbb1f87f4632" CACHE STRING "googletest download url hash" FORCE)

# Uncomment/set to proper value if local instead of remote
set(googletest_ROOT_DIR "") # use remote googletest
#set(re-googletest_ROOT_DIR "${RE_PROJECT_ROOT_DIR}/../../google/googletest")

