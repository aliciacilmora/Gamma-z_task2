#to pull ubuntu image from docker hub
FROM ubuntu:lunar-20230522

RUN docker run -d -p 80:80  ubuntu:lunar-20230522

#coping all the files to the container
COPY feeBreakup.txt /path/
COPY FeeBreakup.txt /path/
COPY genstudent.txt /path/
COPY mess.txt /path/
COPY messAllocation.txt /path/
COPY permit.txt /path/
COPY studentDetails.txt /path/
COPY updateDefaulter.txt /path/

WORKDIR /path

#downloading vi and nano text editor
RUN apt-get update && apt-get install
RUN apt install nano
RUN apt install vi

#appending the text files to ~/.bashrc
RUN cat /path/FeeBreakup.txt >> ~/.bashrc /path/genstudent.txt >> ~/.bashrc /path/messAllocation.txt >> ~/.bashrc /path/permit.txt >> ~/.bashrc /path/updateDefaulter.txt >> ~/.bashrc

RUN feeBreakup
RUN genStudent
RUN updateDefaulter
RUN permit
RUN messAllocation
