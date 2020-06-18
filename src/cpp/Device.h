/*
 * Copyright (c) 2020 pongasoft
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

#ifndef RE_BLANK_PLUGIN_DEVICE_H
#define RE_BLANK_PLUGIN_DEVICE_H

#include "logging.h"
#include "JukeboxTypes.h"

class Device
{
public:
  //! Constructor for when you don't care about sample rate
  Device() : fSampleRate{-1}
  {
    DLOG_F(INFO, "Device()");
  }

  //! Constructor with sample rate
  explicit Device(int iSampleRate) : fSampleRate{iSampleRate}
  {
    DLOG_F(INFO, "Device(%d)", iSampleRate);
  }

  void renderBatch(const TJBox_PropertyDiff *iPropertyDiffs, TJBox_UInt32 iDiffCount);

protected:
  int fSampleRate;
};

#endif //RE_BLANK_PLUGIN_DEVICE_H