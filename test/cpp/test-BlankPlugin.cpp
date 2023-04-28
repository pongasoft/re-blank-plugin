/*
 * Copyright (c) 2021 pongasoft
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * @author Yan Pujante
 */

#include <logging.h>
#include <gtest/gtest.h>
#include <Device.h>
#include <re/mock/DeviceTesters.h>
#include <re_cmake_build.h>

using namespace re::mock;

// Device - SampleRate
TEST(Device, SampleRate)
{
  // make sure that loguru/DCHECK_F calls throw an exception rather than aborting during test
  loguru::init_for_test();

  // Creates a config by reading motherboard_def.lua and realtime_controller.lua
  auto c = DeviceConfig<Device>::fromJBoxExport(RE_CMAKE_PROJECT_DIR);

  // Creates a tester for the device
  auto tester = StudioEffectTester<Device>(c);

  DLOG_F(INFO, "Demonstrating test capability");
  ASSERT_EQ(44100, tester.device()->getSampleRate());
}

// Device - MainLogic
TEST(Device, MainLogic)
{
  // make sure that loguru/DCHECK_F calls throw an exception rather than aborting during test
  loguru::init_for_test();

  // Creates a config by reading motherboard_def.lua and realtime_controller.lua
  auto c = DeviceConfig<Device>::fromJBoxExport(RE_CMAKE_PROJECT_DIR);

  // Creates a tester for the device
  auto tester = StudioEffectTester<Device>(c);

  // Sockets are not yet connected
  ASSERT_FALSE(tester.device().getBool("/audio_outputs/audioOutLeft/connected"));
  ASSERT_FALSE(tester.device().getBool("/audio_outputs/audioOutRight/connected"));

  // Connect the sockets
  tester.wireMainOut("audioOutLeft", "audioOutRight");

  // Sockets are now connected
  ASSERT_TRUE(tester.device().getBool("/audio_outputs/audioOutLeft/connected"));
  ASSERT_TRUE(tester.device().getBool("/audio_outputs/audioOutRight/connected"));

  // Because the blank plugin does nothing, there is no output
  ASSERT_EQ(MockAudioDevice::StereoBuffer{}, tester.nextBatch(MockAudioDevice::buffer(0.5, 0.5)));
}
