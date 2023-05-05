FROM python:3.11
# на основе чего собираем контейнер

# глобальные переменные в системе
ENV PYTHONFAULTHANDLER=1\
  PYTHONUNBUFFERED=1\
  PYTHONHASHSEED=random\
  PIP_NO_CACHE_DIR=off\
  PIP_DISABLE_PIP_VERSION_CHECK=on\
  PIP_DEFAULT_TIMEOUT=100

RUN pip install --upgrade pip  \
# обновляем pip

WORKDIR /code
# задаем папку через которую будем задавать комманды
COPY requirements.txt /code/
# переносим requirements в рабочую директорию code

RUN pip install -r requirements.txt  \
# запускаем и устанавливаем все обновления

COPY . /code
# копируем весь код программы в нашу директорию

