FROM presearch/node:latest

ARG PRIVATE_KEY
ARG PUBLIC_KEY
ARG REGISTRATION_CODE
ARG DESCRIPTION
ARG STAKE

ENV REGISTRATION_CODE=${REGISTRATION_CODE}
ENV DESCRIPTION=${DESCRIPTION}
ENV STAKE=${STAKE}

COPY . .
    
ENV PRIVATE_KEY=${PRIVATE_KEY}
ENV PUBLIC_KEY=${PUBLIC_KEY}

RUN mkdir -p /app/node/.keys
RUN echo -e "${PRIVATE_KEY}" > /app/node/.keys/id_rsa
RUN echo -e "${PUBLIC_KEY}" > /app/node/.keys/id_rsa.pub

COPY start_server.sh /start_server.sh
RUN chmod +x start_server.sh
CMD ["./start_server.sh"]
