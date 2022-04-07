/*
 * Copyright (C) 2017-2021, The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <init_msm8916_base.h>

void vendor_load_properties()
{
    char const fp[] = "google/raven/raven:12/S3B1.220218.004/8242181:user/release-keys";
    char const fp_desc[] = "raven-user 12 S3B1.220218.004 8242181 release-keys";
    
	set_common_properties();
}
