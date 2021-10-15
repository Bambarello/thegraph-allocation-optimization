FROM python:3.8-bullseye
RUN apt update && apt-get install -y glpk-utils libglpk-dev glpk-doc python3-swiglpk

RUN mkdir /src
WORKDIR /src

COPY requirements.txt /src
RUN pip install -r requirements.txt

COPY . /src
RUN mv .env_example .env
ENV RPC_URL https://api.anyblock.tools/ethereum/ethereum/mainnet/rpc/XXXX-XXXX-XXXX-XXXX/

ENTRYPOINT ["python","main.py"]