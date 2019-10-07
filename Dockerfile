# Google Cloud Pub/Sub Documentation
# https://cloud.google.com/pubsub/docs/

FROM google/cloud-sdk
LABEL maintainer="Cesar Perez <cesar@bigtruedata.com>" \
      version="0.1" \
      description="Google Cloud Pub/Sub Emulator"

EXPOSE 8538

ENV PUBSUB_EMULATOR_HOST localhost:8538
# TODO: this has to be parameterized
ENV PUBSUB_PROJECT_ID camelot12345

VOLUME /data

RUN git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git && \
    cd python-docs-samples/pubsub/cloud-client && \
    pip install -r requirements.txt

ENTRYPOINT ["gcloud", "beta", "emulators", "pubsub"]
CMD ["start", "--host-port=0.0.0.0:8538", "--data-dir=/data"]
