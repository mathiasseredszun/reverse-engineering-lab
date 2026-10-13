FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc make binutils python3 ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --uid 10001 learner
WORKDIR /lab
COPY --chown=learner:learner . .
USER learner
CMD ["make", "check-reproducible"]
