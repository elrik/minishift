FROM python:3.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
WORKDIR /code/minishift
CMD python manage.py migrate; gunicorn minishift.wsgi:application -b 0.0.0.0:8000
EXPOSE 8000