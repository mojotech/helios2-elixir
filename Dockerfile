FROM ubuntu:18.04
RUN apt-get update && apt-get install -yq wget gnupg curl build-essential
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb \
   && apt-get update && apt-get install -yq elixir esl-erlang
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh && bash ./nodesource_setup.sh \
   && rm nodesource_setup.sh
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -yq yarn nodejs inotify-tools locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN yarn global add parcel
RUN useradd -ms /bin/bash -d /app app
RUN mkdir /app/secure && chown app:app /app/secure
RUN mkdir /app/tmp && chown app:app /app/tmp
WORKDIR /app
USER app
COPY --chown=app . /app
RUN mix local.hex --force
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force