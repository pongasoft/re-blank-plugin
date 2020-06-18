# Copyright (c) 2020 pongasoft
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#
# @author Yan Pujante

# Defines the location of the logging sources
set(LOGGING_CPP_SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/logging")

# Defines the files to include for logging (they will be included in the Recon build ONLY)
set(logging_sources
    ${LOGGING_CPP_SRC_DIR}/logging.h
    ${LOGGING_CPP_SRC_DIR}/loguru.cpp
    ${LOGGING_CPP_SRC_DIR}/loguru.hpp
    )
