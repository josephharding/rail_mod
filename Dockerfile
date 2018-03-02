FROM iron/go
ARG bin
WORKDIR /app
ADD ${bin} /app/
RUN ln -s ./${bin} executable # have to do this b/c args aren't in scope anymore in entrypoint
ENTRYPOINT ["./executable"]
