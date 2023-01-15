# Copyright (c) 2020-2021 pongasoft
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

# Defining all the 2D source files
# Although you could use a file(GLOB ...) pattern, it is NOT recommended
# as the CMake generation would happen on every single build!
set(re_sources_2d
    # lua files describing the GUI
    "${RE_2D_SRC_DIR}/device_2D.lua"
    "${RE_2D_SRC_DIR}/hdgui_2D.lua"
    # Images for the device
    "${RE_2D_SRC_DIR}/Panel_Back.png"
    "${RE_2D_SRC_DIR}/Panel_Folded_Back.png"
    "${RE_2D_SRC_DIR}/Panel_Folded_Front.png"
    "${RE_2D_SRC_DIR}/Panel_Front.png"
    "${RE_2D_SRC_DIR}/Placeholder.png"
    "${RE_2D_SRC_DIR}/SharedAudioJack_3frames.png"
    "${RE_2D_SRC_DIR}/Tape_Horizontal_1frames.png"
    )