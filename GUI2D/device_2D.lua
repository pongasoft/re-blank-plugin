-- Copyright (c) 2020 pongasoft
--
-- Licensed under the Apache License, Version 2.0 (the "License"); you may not
-- use this file except in compliance with the License. You may obtain a copy of
-- the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
-- WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
-- License for the specific language governing permissions and limitations under
-- the License.
--
-- @author Yan Pujante

format_version = "2.0"

re_edit = { version = "1.1.0" }

--------------------------------------------------------------------------
-- front
--------------------------------------------------------------------------
front = {}

-- Main panel
front["Panel_front_bg"] = { { path = "Panel_Front" } }

-- Widgets
front["TapeFront"] = { offset = { 200, 50 }, { path = "Tape_Horizontal_1frames" } }

--------------------------------------------------------------------------
-- back
--------------------------------------------------------------------------
back = {}

-- Main panel
back["Panel_back_bg"] = { { path = "Panel_Back" } }

-- Widgets
back["TapeBack"] = { offset = { 200, 50 }, { path = "Tape_Horizontal_1frames" } }
back["Placeholder"] = { offset = { 1000, 50 }, { path = "Placeholder" } }
back["audioOutputStereoPairLeft"] = { offset = { 2200, 120 }, { path = "SharedAudioJack_3frames", frames = 3 } }
back["audioOutputStereoPairRight"] = { offset = { 2350, 120 }, { path = "SharedAudioJack_3frames", frames = 3 } }

--------------------------------------------------------------------------
-- folded_front
--------------------------------------------------------------------------
folded_front = {}

-- Main panel
folded_front["Panel_folded_front_bg"] = { { path = "Panel_Folded_Front" } }

-- Widgets
folded_front["TapeFoldedFront"] = { offset = { 200, 50 }, { path = "Tape_Horizontal_1frames" } }

--------------------------------------------------------------------------
-- folded_back
--------------------------------------------------------------------------
folded_back = {}

-- Main panel
folded_back["Panel_folded_back_bg"] = { { path = "Panel_Folded_Back" } }

-- Widgets
folded_back["TapeFoldedBack"] = { offset = { 200, 50 }, { path = "Tape_Horizontal_1frames" } }

-- Cable Origin
folded_back["CableOrigin"] = { offset = { 1000, 50 } }

