FROM python:stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# RUN pip install flask
# RUN pip install gunicorn
EXPOSE 8080

ENTRYPOINT ["gunicorn", "-b", ":8080", "-w","3", "main:APP"]
# CMD ["gunicorn", "--bind", ":8080", "--workers", "3", "main:APP"]
# CMD gunicorn --workers 2 --bind 80:8080 main:APP --max-requests 10000 --timeout 5 --keep-alive 5 --log-level info
