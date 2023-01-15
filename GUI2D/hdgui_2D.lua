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
front_widgets = {}
-- TapeFront
front_widgets[#front_widgets + 1] = jbox.device_name {
  graphics = { node = "TapeFront" }
}
front = jbox.panel{ graphics = { node = "Panel_front_bg" }, widgets = front_widgets }

--------------------------------------------------------------------------
-- back
--------------------------------------------------------------------------
back_widgets = {}
-- TapeBack
back_widgets[#back_widgets + 1] = jbox.device_name {
  graphics = { node = "TapeBack" }
}
-- Placeholder
back_widgets[#back_widgets + 1] = jbox.placeholder {
  graphics = { node = "Placeholder" }
}
-- audioOutputStereoPairLeft
back_widgets[#back_widgets + 1] = jbox.audio_output_socket {
  graphics = { node = "audioOutputStereoPairLeft" },
  socket = "/audio_outputs/audioOutLeft"
}
-- audioOutputStereoPairRight
back_widgets[#back_widgets + 1] = jbox.audio_output_socket {
  graphics = { node = "audioOutputStereoPairRight" },
  socket = "/audio_outputs/audioOutRight"
}
back = jbox.panel{ graphics = { node = "Panel_back_bg" }, widgets = back_widgets }

--------------------------------------------------------------------------
-- folded_front
--------------------------------------------------------------------------
folded_front_widgets = {}
-- TapeFoldedFront
folded_front_widgets[#folded_front_widgets + 1] = jbox.device_name {
  graphics = { node = "TapeFoldedFront" }
}
folded_front = jbox.panel{ graphics = { node = "Panel_folded_front_bg" }, widgets = folded_front_widgets }

--------------------------------------------------------------------------
-- folded_back
--------------------------------------------------------------------------
folded_back_widgets = {}
-- TapeFoldedBack
folded_back_widgets[#folded_back_widgets + 1] = jbox.device_name {
  graphics = { node = "TapeFoldedBack" }
}
folded_back = jbox.panel{ graphics = { node = "Panel_folded_back_bg" }, cable_origin = { node = "CableOrigin" }, widgets = folded_back_widgets }

