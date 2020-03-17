FROM cescoffier/native-base:latest
COPY native-executable/app-runner /application-runner
EXPOSE 8080
CMD ["./application-runner", "-Dquarkus.http.host=0.0.0.0"]