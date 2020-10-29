FROM alpine as build-env
ADD https://github.com/prymitive/karma/releases/download/v0.72/karma-linux-arm64.tar.gz /
RUN tar xzvf karma-linux-arm64.tar.gz

FROM gcr.io/distroless/base
COPY --from=build-env /karma-linux-arm64 /karma
EXPOSE 8080
ENTRYPOINT ["/karma"]
