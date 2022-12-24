FROM python:3.10-slim-buster AS base
LABEL maintainer="Enrique Plata"
ENV APP_HOME /code
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN apt-get update && \
    apt-get install -y locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    echo LANG=en_US.utf8 > /etc/default/locale && \
    apt-get install -yy gcc curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sSL https://install.python-poetry.org | POETRY_HOME=/etc/poetry python3 -
ENV POETRY_HOME /etc/poetry
ENV PATH="${PATH}:/etc/poetry/venv/bin"

FROM base AS installer
WORKDIR $APP_HOME
COPY pyproject.toml poetry.lock ./
RUN poetry install

FROM installer AS runner
COPY src ./src
CMD ["sleep", "1d"]
#CMD [ "python", "./main.py" ]
#CMD ["poetry", "run", "python" "./src/main.py"]