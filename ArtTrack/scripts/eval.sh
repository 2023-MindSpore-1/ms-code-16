#!/usr/bin/env bash
# Copyright 2022 Huawei Technologies Co., Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================
if [ $# -lt 3 ]
then
    echo "Please run the script as: "
    echo "bash scripts/eval.sh TARGET CKPT_PATH PREDICTION_PATH"
    echo "TARGET: mpii_single, coco_multi"
    echo "For example: bash scripts/eval.sh mpii_single ./ckpt_0/arttrack.ckpt out/prediction.mat"
exit 1
fi
python eval.py "$1" --config config/mpii_eval.yaml --option "load_ckpt=$2" --output "$3"
python eval.py "$1" --config config/mpii_eval.yaml --accuracy  --prediction "$3"
