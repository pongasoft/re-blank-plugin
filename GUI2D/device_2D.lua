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

--------------------------------------------------------------------------
-- Front
--------------------------------------------------------------------------
front = {
  Bg = {
    { path = "Panel_Front" },
  },
  TapeFront = {
    offset = { 200, 50 },
    { path = "Tape_Horizontal_1frames" },
  },
}

--------------------------------------------------------------------------
-- Back
--------------------------------------------------------------------------
back = {
  Bg = {
    { path = "Panel_Back" },
  },
  TapeBack = {
    offset = { 200, 50 },
    { path = "Tape_Horizontal_1frames" },
  },
  Placeholder = {
    offset = { 1000, 50 },
    { path = "Placeholder" }
  },

  -- audio out
  {
    offset = { 2200, 120 },
    audioOutputStereoPairLeft = {
      offset = { 0, 0 },
      { path = "Cable_Attachment_Audio_01_1frames" }
    },
    audioOutputStereoPairRight = {
      offset = { 150, 0 },
      { path = "Cable_Attachment_Audio_01_1frames" }
    },
  },

  -- main audio in
--  {
--    offset = { 1420, 320 },
--    audioInputStereoPairLeft = {
--      offset = { 0, 0 },
--      { path = "Cable_Attachment_Audio_01_1frames" }
--    },
--    audioInputStereoPairRight = {
--      offset = { 150, 0 },
--      { path = "Cable_Attachment_Audio_01_1frames" }
--    },
--  },
}

--------------------------------------------------------------------------
-- Folded Front
--------------------------------------------------------------------------
folded_front = {
  Bg = {
    { path = "Panel_Folded_Front" },
  },
  TapeFoldedFront = {
    offset = { 200, 50 },
    { path = "Tape_Horizontal_1frames" },
  },
}

--------------------------------------------------------------------------
-- Folded Back
--------------------------------------------------------------------------
folded_back = {
  Bg = {
    { path = "Panel_Folded_Back" },
  },
  TapeFoldedBack = {
    offset = { 200, 50 },
    { path = "Tape_Horizontal_1frames" },
  },
  CableOrigin = {
    offset = { 1000, 50 },
  },
}
