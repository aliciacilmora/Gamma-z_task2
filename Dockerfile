#to pull ubuntu image from docker hub
FROM ubuntu

RUN apt-get update 

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

#downloading nano text editor
RUN apt-get update && apt-get install
RUN apt install nano

#appending the text files to ~/.bashrc
RUN cat FeeBreakup.txt >> ~/.bashrc genstudent.txt >> ~/.bashrc messAllocation.txt >> ~/.bashrc permit.txt >> ~/.bashrc updateDefaulter.txt >> ~/.bashrc

RUN feeBreakup
RUN genStudent
RUN updateDefaulter
RUN permit
RUN messAllocation


CMD ["/bin/bash"]

#After that we need to save the file using this command given below
#In the same directory as the docker file use  $docker build -t name_of_docker_imamge
#docker run -it name_of_docker_image