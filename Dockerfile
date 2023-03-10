FROM python:3.11 as base
ENV PYTHONUNBUFFERED 1
ADD requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

FROM base
WORKDIR /code
EXPOSE 8000
ADD ./project /code
CMD ./manage.py migrate && ./manage.py runserver 0.0.0.0:8000