# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Use the Google Cloud SDK image.
FROM google/cloud-sdk
RUN apt-get install google-cloud-sdk

RUN apt-get update && apt-get install -y python3-pip python3

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies.
RUN pip3 install Flask gunicorn

# Run the web service on container startup
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app

FROM bash
COPY main.sh .
COPY date.sh .
ENTRYPOINT ["./main.sh"]
