#
# Copyright © 2016 Samsung CNCT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License. 
#
# Dockerfile - Netcat (nc) runner.
#
# - Example Commands:
# docker build --rm -t sostheim/nc-pod .
#
FROM ubuntu:latest

RUN apt update \
  && apt install netcat-openbsd net-tools iproute2 -y \
  && rm -rf /var/lib/apt/lists/*
